class VoteRecord < ActiveRecord::Base
  belongs_to :vote
  belongs_to :vote_token
  validates_presence_of :vote_token_id, :vote_option_id, :vote_id
  validates_uniqueness_of :vote_token_id
end