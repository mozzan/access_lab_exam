class Vote < ActiveRecord::Base
  has_many :vote_tokens
  has_many :vote_records
  has_many :vote_options
  validates_presence_of :topic, :uid
  validates_uniqueness_of :uid
end
