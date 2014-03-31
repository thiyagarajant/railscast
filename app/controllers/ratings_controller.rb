class RatingsController < ApplicationController
  def rate
		@picture = Episode.find(params[:id])
		Rating.delete_all(["rateable_type = 'Episode' AND rateable_id = ? AND user_id = ?",
			@picture.id, current_user.id])
			@rating = Rating.create!(:rateable_type => "book", :user_id => current_user, :rating => params[:rating1], :rateable_id => 

@picture.id)
	  end
end
