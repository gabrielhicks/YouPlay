class CategoriesController < ApplicationController

  def index
    @categories = Video.all.map {|video| video.category}.uniq
  end

  def show
    @category = Video.all.map(params[:id])
  end

end
