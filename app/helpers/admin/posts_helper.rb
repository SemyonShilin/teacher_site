module Admin::PostsHelper
  def select_date_at(post)
    if post.fresh?
      post.created_at
    elsif post.edited? || post.unpublished?
      post.updated_at
    elsif post.published?
        post.published_at
    end
  end
end
