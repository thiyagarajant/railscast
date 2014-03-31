class Comment < ActiveRecord::Base
   attr_accessible :name, :description, :user_id, :episode_id, :parent_id
   belongs_to :user
   belongs_to :episode


# where condition not working
  def self.call(search = nil)
    Rails.cache.fetch("all_cmts_#{search}", :expires_in => 1.day) do 
      self.where("description like ?","%#{search}%").all
    end
  end
end
