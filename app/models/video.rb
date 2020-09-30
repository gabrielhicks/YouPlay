class Video < ApplicationRecord
    has_many :playlist_videos
    has_many :playlists, through: :playlist_videos
    has_many :comments
    validates :category, presence: true
    validates :video_id, uniqueness: true

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
