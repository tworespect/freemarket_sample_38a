class Image < ApplicationRecord
  belongs_to :product, dependent: :destroy

  mount_uploader :first_image,  ImageUploader
  mount_uploader :second_image, ImageUploader
  mount_uploader :third_image,  ImageUploader
  mount_uploader :forth_image,  ImageUploader
end



