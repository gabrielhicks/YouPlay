class CommentsController < ApplicationController
  before_action :find_comment, only: [:show, :edit, :update, :destroy]

  def new
    @comment = Comment.new
  end

  def create
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
  end

  def find_comment
  end
end
