require "redis_wrapper/client"
module IpRateLimit
  IP_LIMIT_PERIOD = (Rails.configuration.access_lab["ip_limit_period"] || 60).to_i
  IP_LIMIT_COUNT = (Rails.configuration.access_lab["ip_limit_count"] || 1000).to_i
  REDIS_PREFIX = "ip_limit_"

  def set_and_check_over_limit?(ip)
    client = RedisWrapper::Client.new

    client.set(key(ip), ip, ex: IP_LIMIT_PERIOD)

    connections = client.keys(key_pattern(ip))
    connections.size > IP_LIMIT_COUNT
  end

  private

  def key(ip)
    dt = DateTime.now.in_time_zone("UTC").strftime("%Y-%m-%d %H:%M:%S.%N")
    "#{REDIS_PREFIX}#{ip}-#{dt}"
  end

  def key_pattern(ip)
    "#{REDIS_PREFIX}#{ip}*"
  end
end