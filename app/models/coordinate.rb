class Coordinate < ApplicationRecord
    mount_uploader :img, ImgUploader
  belongs_to :user
  
  validates :content, presence: true, length: { maximum: 255 }
end
