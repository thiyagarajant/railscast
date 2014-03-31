class CommentsController < ApplicationController
  skip_before_filter :check_session
  
  def index

    @comments = Comment.call(params[:search])
  end

  def show
    @comment = Comment.find(params[:id])

  end

  def new
    @comment = Comment.new

  end

  # GET /comments/1/edit
  def edit
    @comment = Comment.find(params[:id])
    redirect_to "edit_episode_path(@comment)"
  end

  def create
    @comment = Comment.new(params[:comment])
    respond_to do |format|
      if @comment.save
    #raise Comment.find(137).inspect

        format.html { redirect_to "/episodes/#{@comment.episode_id}#tabs1-comment", notice: 'Comment was successfully created.' }
      else
        format.html { redirect_to "/episodes/#{@comment.episode_id}#tabs1-comment" }
      end
    end
  end

  def update
    @comment = Comment.find(params[:id])

    respond_to do |format|
      if @comment.update_attributes(params[:comment])
        format.html { redirect_to @comment, notice: 'Comment was successfully updated.' }
      else
        format.html { render action: "edit" }
      end
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    redirect_to "/comments"
  end
end
