class Video < ApplicationRecord
    has_many :comments
    has_many :playlists

    def category_videos
        video_array = []
        videos = Video.all.each do |video| 
            if video.category == self.category
                video_array << video
            end
        end
        return video_array
    end
end
