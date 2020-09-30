class PlaylistsController < ApplicationController
  before_action :find_playlist, only: [:edit, :update, :destroy]

  def index
    @playlists = @current_user.playlists
  end

  def show
    @playlist = Playlist.find(params[:id])
  end

  def new
    @playlist = Playlist.new
  end



  def create
    @playlist = @current_user.playlists.create(playlist_params)

    if @playlist.valid?
      flash[:new_playlist_added] = "New Playlist Created!"
      redirect_to playlists_path
    else
      flash[:new_playlist_errors] = @playlist.errors.full_messages
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
    params.require(:playlist).permit(:name)
  end

  def find_playlist
    @playlist = Playlist.find_by(id: params[:id])
  end
end
