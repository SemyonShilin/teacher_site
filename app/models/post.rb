class Post < ApplicationRecord
  belongs_to :admin_user
  has_many :images
  has_many :comments

  searchkick# callbacks: :async

  def search_data
    {
      title: title
    }
  end


  # translates :title, :content
  # globalize_accessors locales: [:ru, :en], attributes: [:title, :content]

  mount_uploader :file, FileUploader
end
