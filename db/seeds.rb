require 'pry'
require 'rest-client'
require 'json'
require_relative '../config/environment'


playlist_endpoint1 = RestClient.get(
    'https://www.googleapis.com/youtube/v3/search?part=snippet
                    &q=pop+music
                    &type=playlist
                    &key=AIzaSyCvYkzMg4rMqvzu6b6X10T1Yj283w391J4')
binding.pry

yt_hash = JSON.parse(playlist_endpoint1)


#grab videoID
yt_hash["items"][0]["id"]["videoId"]

#grab PlaylistsTitle
yt_hash["items"][0]["snippet"]["title"]