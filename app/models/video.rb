class Video < ApplicationRecord
    has_many :playlist_videos
    has_many :playlists, through: :playlist_videos
    has_many :comments
    has_many :likes
    has_many :views
    validates :category, presence: true
    validates :video_id, presence: true
    validates :video_id, uniqueness:true

    def self.videos_by_category(category)
        category_videos = []
        self.all.each do |video|
            if video.category == category
                category_videos << video
            end
        end
    end

end