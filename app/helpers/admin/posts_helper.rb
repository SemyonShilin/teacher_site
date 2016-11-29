module Admin::PostsHelper
  def image_list
    Image.where(post_id: nil)
  end
end
