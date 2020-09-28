class PlaylistsController < ApplicationController
  before_action :find_playlist, only: [:show, :edit, :update, :destroy]

  def new
    @playlist = Playlist.new
  end

  def show
    @playlists = @current_user.playlists
  end

  def create
    playlist = @current_user.playlists.create(playlist_params)

    if playlist.valid?
      redirect_to playlist_path(user.playlist)
    else
      flash[:errors] = playlist.errors.full_messages
      redirect_to new_playlist_path
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

  def playlist_params
    params.require(:playlist).permit(:user_id, :video_id, :name)
  end

  def find_playlist
    @playlist = Playlist.find_by(id: params[:id])
  end
end
