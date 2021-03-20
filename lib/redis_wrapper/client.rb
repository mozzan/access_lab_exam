require "redis"
module RedisWrapper
  class Client
    def set(key, value, options = nil)
      client.set(key, value, options)
    end

    def keys(pattern)
      client.keys(pattern)
    end

    private

    def client
      @client ||= Redis.new(host: Rails.configuration.access_lab["redis_server"])
    end
  end
end