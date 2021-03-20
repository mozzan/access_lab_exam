require "spec_helper"

describe SessionsController do
  describe "sessions controller test" do
    include IpRateLimit
    before(:each) do
    end

    it "same ip limit" do
      clean_ip_connections(request.remote_ip)
      60.times.each do
        get(:test_limit)
        expect(response.status).to eq(200)
      end

      get(:test_limit)
      expect(response.status).to eq(400)
      body = JSON.parse(response.body)
      expect(body["message"]).to eq("over limit")
    end
  end
end
