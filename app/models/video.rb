class Video < ApplicationRecord
    has_many :comments
    has_many :playlists
end
