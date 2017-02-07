class Comment < ApplicationRecord
  belongs_to :post
  belongs_to :user

  def as_json(options = {})
    super(options).merge(created_at: I18n.l(self.created_at, format: :long))
  end
end
