class Post < ApplicationRecord
  include Post::StateMachine

  belongs_to :admin_user
  has_one :image, dependent: :nullify, inverse_of: :post
  has_many :comments, dependent: :destroy

  accepts_nested_attributes_for :image

  mount_uploader :file, FileUploader

  aasm column: :status do
    state :fresh, initial: true
    state :fresh, :edited, :published, :unpublished

    event :publish do
      after :notify_published_post do
        set_published_at
      end
      transitions from: [:fresh, :unpublished, :edited], to: :published
    end

    event :edit do
      transitions from: [:fresh, :published, :edited, :unpublished], to: :edited
    end

    event :unpublish do
      transitions from: :published, to: :unpublished
    end
  end

  def notify_published_post
    UserMailer.notify_new_published_post(self).deliver
  end

  def set_published_at
    touch(:published_at)
  end

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
