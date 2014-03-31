class EpisodesController < ApplicationController
  skip_before_filter :check_session, :only => [:index]
    #caches_action :index

  def index
   # raise current_user.inspect
    # logger.info"*******TEST************#{params[:rating]}********"
    @episodes = Episode.list(params[:q],  params[:category_id], params[:episode_type])
  end

  def show
    @episode = Episode.find(params[:id])
    @episode.update_view_count(@episode)
    @comments = @episode.comments
    @comment = Comment.new
  end

  def new
    @episode = Episode.new
  end

  def edit
    @episode = Episode.find(params[:id])
  end

  def create
    @episode = Episode.new(params[:episode])

    respond_to do |format|
      if @episode.save
        format.html { redirect_to @episode, notice: 'Episode was successfully created.' }
      else
        format.html { render action: "new" }
      end
    end
  end

  def update
    @episode = Episode.find(params[:id])

    respond_to do |format|
      if @episode.update_attributes(params[:episode])
        format.html { redirect_to episodes_path, notice: 'Episode was successfully updated.' }
      else
        format.html { render action: "edit" }
      end
    end
  end

  # DELETE /episodes/1
  # DELETE /episodes/1.json
  def destroy
    @episode = Episode.find(params[:id])
    @episode.destroy

    respond_to do |format|
      format.html { redirect_to episodes_url }
    end
  end
end
