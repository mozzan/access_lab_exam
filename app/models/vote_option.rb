class VoteOption < ActiveRecord::Base
  belongs_to :vote
  validates_presence_of :option_uid, :name, :vote_id
  validates_uniqueness_of :option_uid, scope: [:vote_id]
end