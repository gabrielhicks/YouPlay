class CommentsController < ApplicationController
  # before_action :find_comment, only: [:edit, :update, :destroy]

  def new
    @comment = Comment.new
  end

  def create
    # comment = @current_user.comments.create(comment_params)
    # if comment.valid?
    #   redirect_to video_path(@video)
    # else
    #   flash[:errors] = comment.errors.full_messages
    #   redirect_to video_path(@video)
    # end
    @video = Video.find(params[:video_id]) # finds the video with the associated video_id
    @comment = @video.comments.create(comment_params) # creates the comment on the video passing in params 
    @comment.user_id = current_user.id if current_user # assigns logged in user's ID to comment
    @comment.save!
    redirect_to video_path(@video)
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
