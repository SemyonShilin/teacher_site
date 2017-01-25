class Feedback < ApplicationRecord
  belongs_to :user
  belongs_to :admin_user

  scope :new_feedback_count, -> { where(status: :feed_new).count }

  enum status: {
    feed_new: 'new',
    replied: 'replied'
  }

  # validates :email, if: 'current_user.blank?'
end
