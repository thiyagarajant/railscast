class StarsController < ApplicationController
  def rate
  	
		@rating = Star.create!(:user_id => current_user.id, 
			:rating => params[:rating], :episode_id =>params[:episode_id]) 
  end
end
