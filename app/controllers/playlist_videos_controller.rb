class PlaylistVideosController < ApplicationController
    before_action :find_playlist_video, only: [:edit, :update, :destroy]

    def new
        @playlistvideo = PlaylistVideo.new
    end

    def create
      @playlistvideo = PlaylistVideo.create(playlistvideo_params)

      if @playlistvideo.valid?
        flash[:new_playlistvideo_errors] = "New Playlist Created!"
        redirect_to playlists_path(@playlist)
      else
        flash[:new_playlistvideo_errors] = @playlistvideo.errors.full_messages
        redirect_to new_playlist_video_path
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

    def playlistvideo_params
        params.require(:playlist_video).permit!
    end

    def find_playlist_video
        @playlist_video = Playlist.find_by(id: params[:id])
    end
end