
class Playlist < ApplicationRecord
  belongs_to :user
  has_many :playlist_videos
  has_many :videos, through: :playlist_videos
  validates :name, presence: true
end
