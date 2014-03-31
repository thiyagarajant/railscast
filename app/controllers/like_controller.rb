class LikeController < ApplicationController
  def index
  	@like = Like.create(:episode_id => params[:episode_id], :no_of_like => params[:no_of_like], 
  					:no_of_unlike => params[:no_of_unlike], :user_id => current_user.id )
  end
end
