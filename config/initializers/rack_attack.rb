

Rack::Attack.cache.store = ActiveSupport::Cache::MemoryStore.new
class Rack::Attack
    Rack::Attack.blocklist('allow2ban create scrapers') do |req|
        # `filter` returns false value if request is to your login page (but still
        # increments the count) so request below the limit are not blocked until
        # they hit the limit.  At that point, filter will return true and block.
        Rack::Attack::Allow2Ban.filter(req.ip, :maxretry => 2, :findtime => 30.seconds, :bantime => 15.minutes) do
          # The count for the IP is incremented if the return value is truthy.
          req.path == '/posts/new' and req.get?
        end
      end
end
