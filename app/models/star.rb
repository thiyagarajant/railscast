class Star < ActiveRecord::Base
  attr_accessible :average_rating, :episode_id, :rating, :user_id

  belongs_to :user
  belongs_to :episode

  validates_uniqueness_of :episode_id, :scope => :user_id
end
