class ViewsController < ApplicationController

    def new
    end

    def create
        @video = Video.find(params[:video_id]) 
        @view = @video.views.create(view_params)
    end

    private

    def view_params
        params.require(:view).permit(:user_id, :video_id)
    end

end