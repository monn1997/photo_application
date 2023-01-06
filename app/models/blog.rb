class Blog < ApplicationRecord
  mount_uploader :image, ImageUploader
  belongs_to :user
  validates :title, presence: true
  validates :image, presence: true
  validates :content, presence: true,
             length: { maximum: 255 }
end
