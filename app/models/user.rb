
class User < ApplicationRecord
    has_secure_password
    has_many :comments
    has_many :playlists
    validates :username, uniqueness: true, presence: true
end
