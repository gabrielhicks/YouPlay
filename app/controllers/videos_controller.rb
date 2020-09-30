class VideosController < ApplicationController
  skip_before_action :authorized, only: [:index, :show, :search, :handle_search]
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
    @videos = Video.all
    @key = ENV['API_KEY']
    @input = (params[:input])
    @max = '30'
    @playlist = RestClient.get('https://www.googleapis.com/youtube/v3/search?part=snippet&maxResults='+@max+'&q='+@input+'&key='+@key)
    array = JSON.parse(@playlist)
    i = 0
    @max.to_i.times do
      newvid = Video.new(video_id: array["items"][i]["id"]["videoId"], title: array["items"][i]["snippet"]["title"], thumbnail_url: array["items"][i]["snippet"]["thumbnails"]["medium"]["url"], category:@input)
      if newvid.video_id != nil
        newvid.save
      end
      i+=1
    end
    # redirect_to videos_path
  end

end
