class Post < ApplicationRecord
  include Post::StateMachine

  belongs_to :admin_user
  has_one :image, dependent: :nullify, inverse_of: :post
  has_many :comments, dependent: :destroy

  accepts_nested_attributes_for :image

  mount_uploader :file, FileUploader

  # searchkick merge_mappings: true, mappings: { # callbacks: :async
  #   post: {
  #     properties: {
  #       content: { type: 'text' }
  #     }
  #   }
  # }
  #
  # def search_data
  #   {
  #     title: title,
  #     content: content&.html_safe,
  #     status: I18n.t(status, scope: 'posts.status')
  #   }
  # end


  # translates :title, :content
  # globalize_accessors locales: [:ru, :en], attributes: [:title, :content]

  validates :title, :content, presence: true
end
