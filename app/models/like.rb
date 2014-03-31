class Like < ActiveRecord::Base
  attr_accessible :episode_id, :no_of_like, :no_of_unlike, :user_id

  belongs_to :episode
end
