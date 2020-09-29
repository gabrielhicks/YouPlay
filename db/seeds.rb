# require 'pry'
# require 'rest-client'
# require 'json'
# require_relative '../config/environment'
# Video.destroy_all

# @key = ENV['API_KEY']

# # query = ["Ruby+on+Rails", "Java+Programming","JavaScript+ES6","Reactjs+Tutorial","Nodejs+Tutorial", "Expressjs+Tutorial", "Laravel+Tutorial", "PHP+Tutorial", "Bootstrap+CSS+Tutorial","Vanilla+CSS+Tutorial"]

# @youtube1 = RestClient.get('https://www.googleapis.com/youtube/v3/search?part=snippet&maxResults=50&q=ruby+tutorial&key='+@key)
# @youtube2 = RestClient.get('https://www.googleapis.com/youtube/v3/search?part=snippet&maxResults=50&q=Java+Programming+Tutorial&key='+@key)
# @youtube3 = RestClient.get('https://www.googleapis.com/youtube/v3/search?part=snippet&maxResults=50&q=JavaScript+ES6+Tutorial&key='+@key)
# @youtube4 = RestClient.get('https://www.googleapis.com/youtube/v3/search?part=snippet&maxResults=50&q=Reactjs+Tutorial&key='+@key)
# @youtube5 = RestClient.get('https://www.googleapis.com/youtube/v3/search?part=snippet&maxResults=50&q=Nodejs+Tutorial&key='+@key)
# @youtube6 = RestClient.get('https://www.googleapis.com/youtube/v3/search?part=snippet&maxResults=50&q=Expressjs+Tutorial&key='+@key)
# @youtube7 = RestClient.get('https://www.googleapis.com/youtube/v3/search?part=snippet&maxResults=50&q=Laravel+Tutorial&key='+@key)
# @youtube8 = RestClient.get('https://www.googleapis.com/youtube/v3/search?part=snippet&maxResults=50&q=PHP+Tutorial&key='+@key)
# @youtube9 = RestClient.get('https://www.googleapis.com/youtube/v3/search?part=snippet&maxResults=50&q=Bootstrap+CSS+Tutorial&key='+@key)
# @youtube10 = RestClient.get('https://www.googleapis.com/youtube/v3/search?part=snippet&maxResults=50&q=Vanilla+CSS+Tutorial&key='+@key)

# @yt1 = JSON.parse(@youtube1)
# binding.pry
# @yt2 = JSON.parse(@youtube2)
# @yt3 = JSON.parse(@youtube3)
# @yt4 = JSON.parse(@youtube4)
# @yt5 = JSON.parse(@youtube5)
# @yt6 = JSON.parse(@youtube6)
# @yt7 = JSON.parse(@youtube7)
# @yt8 = JSON.parse(@youtube8)
# @yt9 = JSON.parse(@youtube9)
# @yt10 = JSON.parse(@youtube10)

# @yt_array = [@yt1, @yt2, @yt3, @yt4, @yt5, @yt6, @yt7, @yt8, @yt9, @yt10]

# j=0
# @yt_array.each do |array|
# category_names = ["Ruby on Rails", "Java", "JavaScript", "React", "Node", "Express", "Laravel", "PHP", "Bootstrap", "CSS"]
#         i=0
#         50.times do
#             Video.create(video_id: array["items"][i]["id"]["videoId"], title: array["items"][i]["snippet"]["title"], thumbnail_url: array["items"][i]["snippet"]["thumbnails"]["medium"]["url"], category: category_names[j])
#         i+=1
#         end
#     j+=1
# end
################################################################################
PlaylistVideo.destroy_all
Playlist.destroy_all

user1 = User.first
user2 = User.second
video1 = Video.first
video2 = Video.second
video3 = Video.third
video4 = Video.fourth
playlist1 = Playlist.create(name: "First", user: user1)
playlist2 = Playlist.create(name: "Second", user: user2)
playlist3 = Playlist.create(name: "Third", user: user2)
playlistvideo1 = PlaylistVideo.create(playlist: playlist1, video: video1)
playlistvideo2 = PlaylistVideo.create(playlist: playlist2, video: video2)
playlistvideo3 = PlaylistVideo.create(playlist: playlist3, video: video3)
playlistvideo4 = PlaylistVideo.create(playlist: playlist2, video: video4)
playlistvideo5 = PlaylistVideo.create(playlist: playlist2, video: video3)
playlistvideo6 = PlaylistVideo.create(playlist: playlist3, video: video2)
playlistvideo7 = PlaylistVideo.create(playlist: playlist2, video: video1)
comment1 = Comment.create(user: user1, video: video1, content: "Hey this video is bad")
comment2 = Comment.create(user: user2, video: video1, content: "No this video is good!")
