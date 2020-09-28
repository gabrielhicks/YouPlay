class VideosController < ApplicationController

  def index
    @videos = Video.all
  end

  def show
    @videos = Video.all
    @video = Video.find(params[:id])
  end

  def search

  end

  def handle_search
    @input = (params[:input])
    byebug
    @playlist = RestClient.get('https://www.googleapis.com/youtube/v3/search?part=snippet&maxResults=50&q='+@input+'&key=AIzaSyBuVA_lzCCxno3CnOYXp3LQRJb7tgoc8ZU')
    array = JSON.parse(@playlist)

    i = 0
    50.times do
      Video.create(video_id: array["items"][i]["id"]["videoId"], title: array["items"][i]["snippet"]["title"], thumbnail_url: array["items"][i]["snippet"]["thumbnails"]["medium"]["url"], category:@input)
      i+=1
    end
    redirect_to videos_path
  end



end
