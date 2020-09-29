class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :video
  validates :content, presence: true
end
