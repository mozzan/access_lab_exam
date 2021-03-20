class VoteToken < ActiveRecord::Base
  belongs_to :vote
  has_one :vote_record
  validates_presence_of :vote_id, :token
  validates_uniqueness_of :token, scope: [:vote_id]

end