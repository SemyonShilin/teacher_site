class Image < ApplicationRecord
  belongs_to :post, inverse_of: :image

  mount_uploader :photo, ImageUploader

  # searchkick
  #
  # def search_data
  #   {
  #     photo: photo_identifier
  #   }
  # end
end
