class SessionsController < ApplicationController
  include ApplicationHelper

  def test_limit
    render status: 200, json: {}
  end

end
