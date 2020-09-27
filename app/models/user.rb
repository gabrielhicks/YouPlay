class User < ApplicationRecord
    has_secure_password
    has_many :comments
    has_many :playlists
    has_many :videos, through: :playlists
end
