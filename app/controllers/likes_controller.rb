class LikesController < ApplicationController

    def new
    end
    
    def create
        @video = Video.find(params[:video_id]) 
        @like = @video.likes.create(like_params)
    end

    def destroy
        @video = Video.find(params[:video_id])
        @video.likes.where(user: @current_user).destroy_all
        # redirect_to video_path(video)
    end

    private

    def like_params
        params.require(:like).permit(:user_id, :video_id)
    end

end