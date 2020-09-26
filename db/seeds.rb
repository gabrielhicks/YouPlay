require 'pry'
require 'rest-client'
require 'json'
require_relative '../config/environment'


# youtube1 = RestClient.get('https://www.googleapis.com/youtube/v3/search?part=snippet&maxResults=50&q=Ruby+on+Rails+tutorial&key=AIzaSyBiG-tMunkvgeL-eKemUnKV4ruXgZROQTY')
youtube2 = RestClient.get('https://www.googleapis.com/youtube/v3/search?part=snippet&maxResults=50&q=Java+Programming+Tutorial&key=AIzaSyBiG-tMunkvgeL-eKemUnKV4ruXgZROQTY')
# youtube3 = RestClient.get('https://www.googleapis.com/youtube/v3/search?part=snippet&maxResults=50&q=JavaScript+ES6+Tutorial&key=AIzaSyBiG-tMunkvgeL-eKemUnKV4ruXgZROQTY')
youtube4 = RestClient.get('https://www.googleapis.com/youtube/v3/search?part=snippet&maxResults=50&q=Reactjs+Tutorial&key=AIzaSyBiG-tMunkvgeL-eKemUnKV4ruXgZROQTY')
# youtube5 = RestClient.get('https://www.googleapis.com/youtube/v3/search?part=snippet&maxResults=50&q=Nodejs+Tutorial&key=AIzaSyBiG-tMunkvgeL-eKemUnKV4ruXgZROQTY')
youtube6 = RestClient.get('https://www.googleapis.com/youtube/v3/search?part=snippet&maxResults=50&q=Expressjs+Tutorial&key=AIzaSyBiG-tMunkvgeL-eKemUnKV4ruXgZROQTY')
youtube7 = RestClient.get('https://www.googleapis.com/youtube/v3/search?part=snippet&maxResults=50&q=Laravel+Tutorial&key=AIzaSyBiG-tMunkvgeL-eKemUnKV4ruXgZROQTY')
youtube8 = RestClient.get('https://www.googleapis.com/youtube/v3/search?part=snippet&maxResults=50&q=PHP+Tutorial&key=AIzaSyBiG-tMunkvgeL-eKemUnKV4ruXgZROQTY')
youtube9 = RestClient.get('https://www.googleapis.com/youtube/v3/search?part=snippet&maxResults=50&q=Bootstrap+CSS+Tutorial&key=AIzaSyBiG-tMunkvgeL-eKemUnKV4ruXgZROQTY')
youtube10 = RestClient.get('https://www.googleapis.com/youtube/v3/search?part=snippet&maxResults=50&q=Vanilla+CSS+Tutorial&key=AIzaSyBiG-tMunkvgeL-eKemUnKV4ruXgZROQTY')

# yt1 = JSON.parse(youtube1)
yt2 = JSON.parse(youtube2)
# yt3 = JSON.parse(youtube3)
yt4 = JSON.parse(youtube4)
# yt5 = JSON.parse(youtube5)
yt6 = JSON.parse(youtube6)
yt7 = JSON.parse(youtube7)
yt8 = JSON.parse(youtube8)
yt9 = JSON.parse(youtube9)
yt10 = JSON.parse(youtube10)

yt_array = [yt2, yt4, yt6, yt7, yt8, yt9, yt10]


yt_array.each do |array|
    i=0

    50.times do
        Video.create(video_id: array["items"][i]["id"]["videoId"], title: array["items"][i]["snippet"]["title"], thumbnail_url: array["items"][i]["snippet"]["thumbnails"]["medium"]["url"])
    i+=1
    end

end

# #grab videoID
# yt_hash["items"][0]["id"]["videoId"]

# #grab PlaylistsTitle
# yt_hash["items"][0]["snippet"]["title"]