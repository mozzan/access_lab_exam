class ApplicationController < ActionController::Base
  include IpRateLimit
  skip_before_action :verify_authenticity_token
  before_action :check_ip_limit

  def check_ip_limit
    limited = set_and_check_over_limit?(request.remote_ip)
    render status: 400, json: {message: "over limit"} if limited
  end
end
