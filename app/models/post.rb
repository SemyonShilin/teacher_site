class Post < ApplicationRecord
  belongs_to :admin_user
  has_one :image, dependent: :nullify, inverse_of: :post
  has_many :comments, dependent: :destroy

  accepts_nested_attributes_for :image

  searchkick merge_mappings: true, mappings: { # callbacks: :async
    post: {
      properties: {
        content: { type: 'text' }
      }
    }
  }

  def search_data
    {
      title: title,
      content: content&.html_safe
    }
  end


  # translates :title, :content
  # globalize_accessors locales: [:ru, :en], attributes: [:title, :content]

  mount_uploader :file, FileUploader
end
