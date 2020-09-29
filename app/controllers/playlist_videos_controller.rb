class PlaylistVideosController < ApplicationController
    before_action :find_playlist, only: [:edit, :update, :destroy]

    def new
        @playlist_video = PlaylistVideo.new
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

    def playlist_params
        params.require(:playlist_video).permit(:playlist_id, :video_id)
    end

    def find_playlist_video
        @playlist_video = Playlist.find_by(id: params[:id])
    end
end
