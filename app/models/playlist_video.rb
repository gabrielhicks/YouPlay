class PlaylistVideo < ApplicationRecord
    belongs_to :video
    belongs_to :playlist
    validates :video_id, uniqueness: {scope: :playlist_id}
end