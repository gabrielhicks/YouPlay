require 'pry'
require 'rest-client'
require 'json'
require_relative '../config/environment'
Category.destroy_all
Video.destroy_all

@youtube1 = RestClient.get('https://www.googleapis.com/youtube/v3/search?part=snippet&maxResults=50&q=Ruby+on+Rails+tutorial&key=AIzaSyCa_t27LjcFUYh0FoF0rtw65TxS-RuxudQ')
@youtube2 = RestClient.get('https://www.googleapis.com/youtube/v3/search?part=snippet&maxResults=50&q=Java+Programming+Tutorial&key=AIzaSyCa_t27LjcFUYh0FoF0rtw65TxS-RuxudQ')
@youtube3 = RestClient.get('https://www.googleapis.com/youtube/v3/search?part=snippet&maxResults=50&q=JavaScript+ES6+Tutorial&key=AIzaSyCa_t27LjcFUYh0FoF0rtw65TxS-RuxudQ')
@youtube4 = RestClient.get('https://www.googleapis.com/youtube/v3/search?part=snippet&maxResults=50&q=Reactjs+Tutorial&key=AIzaSyCa_t27LjcFUYh0FoF0rtw65TxS-RuxudQ')
@youtube5 = RestClient.get('https://www.googleapis.com/youtube/v3/search?part=snippet&maxResults=50&q=Nodejs+Tutorial&key=AIzaSyCa_t27LjcFUYh0FoF0rtw65TxS-RuxudQ')
@youtube6 = RestClient.get('https://www.googleapis.com/youtube/v3/search?part=snippet&maxResults=50&q=Expressjs+Tutorial&key=AIzaSyCa_t27LjcFUYh0FoF0rtw65TxS-RuxudQ')
@youtube7 = RestClient.get('https://www.googleapis.com/youtube/v3/search?part=snippet&maxResults=50&q=Laravel+Tutorial&key=AIzaSyCa_t27LjcFUYh0FoF0rtw65TxS-RuxudQ')
@youtube8 = RestClient.get('https://www.googleapis.com/youtube/v3/search?part=snippet&maxResults=50&q=PHP+Tutorial&key=AIzaSyCa_t27LjcFUYh0FoF0rtw65TxS-RuxudQ')
@youtube9 = RestClient.get('https://www.googleapis.com/youtube/v3/search?part=snippet&maxResults=50&q=Bootstrap+CSS+Tutorial&key=AIzaSyCa_t27LjcFUYh0FoF0rtw65TxS-RuxudQ')
@youtube10 = RestClient.get('https://www.googleapis.com/youtube/v3/search?part=snippet&maxResults=50&q=Vanilla+CSS+Tutorial&key=AIzaSyCa_t27LjcFUYh0FoF0rtw65TxS-RuxudQ')

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

rails = Category.create(name: "Ruby on Rails")
java = Category.create(name: "Java")
js = Category.create(name: "JavaScript")
react = Category.create(name: "React.js")
node = Category.create(name: "Node.js")
express = Category.create(name: "Express.js")
laravel = Category.create(name: "Laravel")
php = Category.create(name: "PHP")
bootstrap = Category.create(name: "Bootstrap")
css = Category.create(name: "CSS")

@yt_array.each do |array|
    i=0
    50.times do
        Video.create(video_id: array["items"][i]["id"]["videoId"], title: array["items"][i]["snippet"]["title"], thumbnail_url: array["items"][i]["snippet"]["thumbnails"]["medium"]["url"], category_id: 1)
    i+=1
    end
end

Video.all[1..49].each {|video| video.update(category: rails)}
Video.all[50..99].each {|video| video.update(category: java)}
Video.all[100..149].each {|video| video.update(category: js)}
Video.all[150..199].each {|video| video.update(category: react)}
Video.all[200..249].each {|video| video.update(category: node)}
Video.all[250..299].each {|video| video.update(category: express)}
Video.all[300..349].each {|video| video.update(category: laravel)}
Video.all[350..399].each {|video| video.update(category: php)}
Video.all[400..449].each {|video| video.update(category: bootstrap)}
Video.all[450..499].each {|video| video.update(category: css)}