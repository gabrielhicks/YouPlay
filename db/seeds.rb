require 'pry'
require 'rest-client'
require 'json'
require_relative '../config/environment'

Video.destroy_all

@youtube1 = RestClient.get('https://www.googleapis.com/youtube/v3/search?part=snippet&maxResults=50&q=Ruby+on+Rails+tutorial&key=AIzaSyDRVAFtAc8J0vgA8aajkQccjKUHYHMpEYU')
@youtube2 = RestClient.get('https://www.googleapis.com/youtube/v3/search?part=snippet&maxResults=50&q=Java+Programming+Tutorial&key=AIzaSyDRVAFtAc8J0vgA8aajkQccjKUHYHMpEYU')
@youtube3 = RestClient.get('https://www.googleapis.com/youtube/v3/search?part=snippet&maxResults=50&q=JavaScript+ES6+Tutorial&key=AIzaSyDRVAFtAc8J0vgA8aajkQccjKUHYHMpEYU')
@youtube4 = RestClient.get('https://www.googleapis.com/youtube/v3/search?part=snippet&maxResults=50&q=Reactjs+Tutorial&key=AIzaSyDRVAFtAc8J0vgA8aajkQccjKUHYHMpEYU')
@youtube5 = RestClient.get('https://www.googleapis.com/youtube/v3/search?part=snippet&maxResults=50&q=Nodejs+Tutorial&key=AIzaSyDRVAFtAc8J0vgA8aajkQccjKUHYHMpEYU')
@youtube6 = RestClient.get('https://www.googleapis.com/youtube/v3/search?part=snippet&maxResults=50&q=Expressjs+Tutorial&key=AIzaSyDRVAFtAc8J0vgA8aajkQccjKUHYHMpEYU')
@youtube7 = RestClient.get('https://www.googleapis.com/youtube/v3/search?part=snippet&maxResults=50&q=Laravel+Tutorial&key=AIzaSyDRVAFtAc8J0vgA8aajkQccjKUHYHMpEYU')
@youtube8 = RestClient.get('https://www.googleapis.com/youtube/v3/search?part=snippet&maxResults=50&q=PHP+Tutorial&key=AIzaSyDRVAFtAc8J0vgA8aajkQccjKUHYHMpEYU')
@youtube9 = RestClient.get('https://www.googleapis.com/youtube/v3/search?part=snippet&maxResults=50&q=Bootstrap+CSS+Tutorial&key=AIzaSyDRVAFtAc8J0vgA8aajkQccjKUHYHMpEYU')
@youtube10 = RestClient.get('https://www.googleapis.com/youtube/v3/search?part=snippet&maxResults=50&q=Vanilla+CSS+Tutorial&key=AIzaSyDRVAFtAc8J0vgA8aajkQccjKUHYHMpEYU')

@yt1 = JSON.parse(@youtube1)
@yt2 = JSON.parse(@youtube2)
@yt3 = JSON.parse(@youtube3)
@yt4 = JSON.parse(@youtube4)
@yt5 = JSON.parse(@youtube5)
@yt6 = JSON.parse(@youtube6)
@yt7 = JSON.parse(@youtube7)
@yt8 = JSON.parse(@youtube8)
@yt9 = JSON.parse(@youtube9)
@yt10 = JSON.parse(@youtube10)

@yt_array = [@yt1, @yt2, @yt3, @yt4, @yt5, @yt6, @yt7, @yt8, @yt9, @yt10]

@yt_array.each do |array|
    i=0
    50.times do
        Video.create(video_id: array["items"][i]["id"]["videoId"], title: array["items"][i]["snippet"]["title"], thumbnail_url: array["items"][i]["snippet"]["thumbnails"]["medium"]["url"])
    i+=1
    end
end