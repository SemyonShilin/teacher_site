module Admin::DashboardHelper
  def line_for_posts_count
    posts = {}
    Post.all.group_by{|e| e.created_at.beginning_of_week}.each{|key, value| posts[key.to_date] = value.count }
    posts
  end

  def line_for_users_count
    posts = {}
    User.all.group_by{|e| e.created_at.beginning_of_week}.each{|key, value| posts[key.to_date] = value.count }
    posts
  end
end
