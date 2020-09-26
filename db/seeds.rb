require 'pry'
require 'rest-client'
require 'json'
require_relative '../config/environment'

Video.destroy_all

playlist = RestClient.get('https://www.googleapis.com/youtube/v3/search?part=snippet&maxResults=50&q=music&key=AIzaSyCvYkzMg4rMqvzu6b6X10T1Yj283w391J4')

# AIzaSyCvYkzMg4rMqvzu6b6X10T1Yj283w391J4
youtube = JSON.parse(playlist)
# binding.pry
i=0
50.times do
  Video.create(video_id: youtube["items"][i]["id"]["videoId"], title: youtube["items"][i]["snippet"]["title"])
  i+=1
end
