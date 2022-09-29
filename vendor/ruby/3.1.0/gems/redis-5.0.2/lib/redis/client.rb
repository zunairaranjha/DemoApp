# frozen_string_literal: true

require 'redis-client'

class Redis
  class Client < ::RedisClient
    ERROR_MAPPING = {
      RedisClient::ConnectionError => Redis::ConnectionError,
      RedisClient::CommandError => Redis::CommandError,
      RedisClient::ReadTimeoutError => Redis::TimeoutError,
      RedisClient::CannotConnectError => Redis::CannotConnectError,
      RedisClient::AuthenticationError => Redis::CannotConnectError,
      RedisClient::FailoverError => Redis::CannotConnectError,
      RedisClient::PermissionError => Redis::PermissionError,
      RedisClient::WrongTypeError => Redis::WrongTypeError,
      RedisClient::ReadOnlyError => Redis::ReadOnlyError,
      RedisClient::ProtocolError => Redis::ProtocolError,
    }.freeze

    class << self
      def config(**kwargs)
        super(protocol: 2, **kwargs)
      end

      def sentinel(**kwargs)
        super(protocol: 2, **kwargs)
      end
    end

    def initialize(*)
      super
      @inherit_socket = false
      @pid = nil
    end
    ruby2_keywords :initialize if respond_to?(:ruby2_keywords, true)

    def id
      config.id
    end

    def server_url
      config.server_url
    end

    def timeout
      config.read_timeout
    end

    def db
      config.db
    end

    def host
      config.host unless config.path
    end

    def port
      config.port unless config.path
    end

    def path
      config.path
    end

    def username
      config.username
    end

    def password
      config.password
    end

    undef_method :call
    undef_method :call_once
    undef_method :call_once_v
    undef_method :blocking_call

    def call_v(command, &block)
      super(command, &block)
    rescue ::RedisClient::Error => error
      raise ERROR_MAPPING.fetch(error.class), error.message, error.backtrace
    end

    def blocking_call_v(timeout, command, &block)
      if timeout && timeout > 0
        # Can't use the command timeout argument as the connection timeout
        # otherwise it would be very racy. So we add an extra 100ms to account for
        # the network delay.
        timeout += 0.1
      end

      super(timeout, command, &block)
    rescue ::RedisClient::Error => error
      raise ERROR_MAPPING.fetch(error.class), error.message, error.backtrace
    end

    def pipelined
      super
    rescue ::RedisClient::Error => error
      raise ERROR_MAPPING.fetch(error.class), error.message, error.backtrace
    end

    def multi
      super
    rescue ::RedisClient::Error => error
      raise ERROR_MAPPING.fetch(error.class), error.message, error.backtrace
    end

    def disable_reconnection(&block)
      ensure_connected(retryable: false, &block)
    end

    def inherit_socket!
      @inherit_socket = true
    end

    def close
      super
      @pid = nil
    end

    private

    def ensure_connected(retryable: true)
      unless @inherit_socket || (@pid ||= Process.pid) == Process.pid
        raise InheritedError,
              "Tried to use a connection from a child process without reconnecting. " \
              "You need to reconnect to Redis after forking " \
              "or set :inherit_socket to true."
      end

      super
    end
  end
end
