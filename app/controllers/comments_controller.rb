class CommentsController < ApplicationController
  before_action :find_comment, only: [:show, :edit, :update, :destroy]

  def new
    @comment = Comment.new
  end

  def create
    comment = @current_user.comments.create(comment_params)

    if comment.valid?
      redirect_to video_path(@video)
    else
      flash[:errors] = comment.errors.full_messages
      redirect_to video_path(@video)
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

  def delete
  end

  private

  def comment_params
    params.require(:comment).permit(:user_id, :video_id, :content)
  end

  def find_comment
    @comment = Comment.find_by(id: params[:id])
  end
end
