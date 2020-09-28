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
    @max = '20'
    @playlist = RestClient.get('https://www.googleapis.com/youtube/v3/search?part=snippet&maxResults='+@max+'&q='+@input+'&key=AIzaSyCSRVb7dvx-58dq8j7s7oos7aG5uMzdmvw')
    array = JSON.parse(@playlist)

    i = 0
    @max.to_i.times do
      Video.create(video_id: array["items"][i]["id"]["videoId"], title: array["items"][i]["snippet"]["title"], thumbnail_url: array["items"][i]["snippet"]["thumbnails"]["medium"]["url"], category:@input)
      i+=1
    end
    redirect_to videos_path
  end



end
