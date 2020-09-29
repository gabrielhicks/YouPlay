class CommentsController < ApplicationController
  # before_action :find_comment, only: [:edit, :update, :destroy]

  def new
    @video = Video.find(params[:id])
    @comment = Comment.new
  end

  def create
    @video = Video.find(params[:video_id])
    @comment = @video.comments.create(comment_params)
    # respond_to do |format|
    #   format.js
    #   format.html {redirect_to comments_url}
    # end
    # redirect_to video_path(@video)
  end

  def edit
  end

  def update
    @video = Video.find(params[:video_id])
    @comment = @video.comments.find(params[:id])
    @comment.update(comment_params)
    redirect_to video_path(@video)
  end

  def destroy
    @video = Video.find(params[:video_id])
    @comment = @video.comments.find(params[:id])
    @comment.destroy
    redirect_to video_path(@video)
  end

  private

  def comment_params
    params.require(:comment).permit(:user_id, :video_id, :content)
  end

  def find_comment
    @comment = Comment.find_by(id: params[:id])
  end
end
