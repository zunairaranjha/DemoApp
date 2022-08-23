require 'active_support/time'
require_relative '../result'

module RailsRateLimiter
  module Strategies
    class SlidingWindowLog
      TIMESTAMP_ACCURACY = 10_000

      attr_reader :limit, :expires_in, :requester_pattern

      # @param limit [Fixnum, Lambda, Proc] The number of allowed
      #   requests per time period.
      # @param per [Fixnum, Lambda, Proc] :per Time period in seconds.
      # @param requester [Lambda, Proc] Identifies request
      # @param client [Object, Proc] Redis client
      def initialize(limit, per, requester, client = nil)
        @limit = limit.respond_to?(:call) ? limit.call : limit
        @expires_in = calculate_expires_in(per)
        @requester_pattern = requester
        @client = client.is_a?(Proc) ? client.call : client # Redis client already responds to #call so we have to strict
      end

      def run
        remove_expired_set_members
        return Result.new(time_left) if client.zcard(cache_key) >= limit
        log_request
        Result.new(0)
      end

      private

      def client
        @client ||= Redis.new
      end

      # Removes all SORTED SET members that have a score < current_timestamp
      def remove_expired_set_members
        client.zremrangebyscore(cache_key, '-inf', "(#{current_timestamp}")
      end

      # Adds requests to SORTED SET with expiring_timestamp
      # and current_timestamp
      def log_request
        expiring_timestamp = current_timestamp + expires_in
        client.zadd(cache_key, expiring_timestamp, current_timestamp)
      end

      def time_left
        timestamp = client.zrange(cache_key, 0, 0, with_scores: true)[0][1]
        ((timestamp - current_timestamp).to_f / TIMESTAMP_ACCURACY).ceil
      end

      def cache_key
        "rate_limiter_#{requester_pattern}"
      end

      def current_timestamp
        @current_timestamp ||= (Time.zone.now.to_f * TIMESTAMP_ACCURACY).to_i
      end

      def calculate_expires_in(per)
        value = per.respond_to?(:call) ? per.call : per
        (value.to_f * TIMESTAMP_ACCURACY).to_i
      end
    end
  end
end
