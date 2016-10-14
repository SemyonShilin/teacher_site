class Post < ApplicationRecord
  belongs_to :admin_user

  translates :title, :content
  globalize_accessors locales: [:ru, :en], attributes: [:title, :content]

  mount_uploader :file, FileUploader
end
