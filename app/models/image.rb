class Image < ApplicationRecord
  belongs_to :post

  mount_uploader :photo, ImageUploader

  searchkick

  def search_data
    {
      photo: photo_identifier
    }
  end
end
