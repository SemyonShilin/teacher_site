module ApplicationHelper
  def three_last_posts
    Post.order(:created_at).take(3)
  end
end
