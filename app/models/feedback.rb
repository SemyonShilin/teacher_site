class Feedback < ApplicationRecord
  belongs_to :user
  belongs_to :admin_user

  scope :new_feedback_count, -> { where(status: :feed_new).count }
  scope :feed_new, -> { where(status: :feed_new) }
  scope :replied, -> { where(status: :replied) }

  enum status: {
    feed_new: 'new',
    replied: 'replied'
  }

  searchkick# callbacks: :async

  def search_data
    {
      email: user&.email,
      user_email: user_email,
      status: I18n.t(status, scope: 'activerecord.enum.status', locale: :ru)
    }
  end


  # validates :email, if: 'current_user.blank?'
  validates :body, presence: true
  validates :admin_message, presence: true, if: -> { admin_user }
end
