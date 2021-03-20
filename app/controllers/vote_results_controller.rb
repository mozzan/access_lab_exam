class VoteResultsController < ApplicationController
  include ApplicationHelper
  before_action :find_vote, only: [:create, :index]

  def create
    vote_token = @vote.vote_tokens.find_by(token: params[:token])
    return render status: 400, json: {message: "invalid token"} if vote_token.nil?

    vote_option = @vote.vote_options.find_by(option_uid: params[:option_uid])
    return render status: 400, json: {message: "invalid option"} if vote_option.nil?

    vote_record = @vote.vote_records.find_by(vote_token_id: vote_token.id)
    return render status: 400, json: {message: "already voted before"} if vote_record.present?

    begin
      ActiveRecord::Base.transaction do
        @vote.vote_records.create!(vote_option_id: vote_option.id, vote_token_id: vote_token.id)
        render status: 200, json: {message: "vote successfully"}
      end
    rescue => ex
      logger.error ex
      render status: 400, json: {message: "vote failed"}
    end
  end

  def index
    count = @vote.vote_records.size
    render status: 200, json: {vote_count: count}
  end

  private

  def find_vote
    @vote = Vote.find_by(uid: params[:uid])
    render status: 404, json: {message: "invalid vote"} if @vote.nil?
  end
end
