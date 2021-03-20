require "spec_helper"

describe VoteResultsController do
  describe "vote results controller test" do
    before(:each) do
      init_vote_sample
    end

    it "invalid vote" do
      post(:create, params: {uid: "wrong uid"})
      expect(response.status).to eq(404)
      body = JSON.parse(response.body)
      expect(body["message"]).to eq("invalid vote")
    end

    it "invalid token" do
      post(:create, params: {uid: @vote.uid, token: "wrong token"})
      expect(response.status).to eq(400)
      body = JSON.parse(response.body)
      expect(body["message"]).to eq("invalid token")
    end

    it "invalid option" do
      post(:create, params: {uid: @vote.uid, token: @vote_tokens.sample.token, option_uid: "wrong option uid"})
      expect(response.status).to eq(400)
      body = JSON.parse(response.body)
      expect(body["message"]).to eq("invalid option")
    end

    it "token already voted before" do
      vote_token = @vote_tokens.sample
      VoteRecord.create(vote_id: @vote.id, vote_token_id: vote_token.id, vote_option_id: @vote_option1.id)
      post(:create, params: {uid: @vote.uid, token: vote_token.token, option_uid: @vote_option1.option_uid})
      expect(response.status).to eq(400)
      body = JSON.parse(response.body)
      expect(body["message"]).to eq("already voted before")
    end

    it "vote successfully" do
      post(:create, params: {uid: @vote.uid, token: @vote_tokens.sample.token, option_uid: @vote_option1.option_uid})
      expect(response.status).to eq(200)
    end

    it "vote count" do
      vote_token = @vote_tokens.sample
      VoteRecord.create(vote_id: @vote.id, vote_token_id: vote_token.id, vote_option_id: @vote_option1.id)
      get(:index, params: {uid: @vote.uid})
      expect(response.status).to eq(200)
      body = JSON.parse(response.body)
      expect(body["vote_count"]).to eq(1)
    end
  end
end
