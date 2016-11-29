module Admin::ApplicationHelper
  def amount_new_users
    User.where('created_at > ? AND created_at < ?', Date.current.beginning_of_month, Date.current.end_of_month).count
  end
end
