module Admin::ImagesHelper
  def post_list_without_image
    Post.includes(:image).where(images: { post_id: nil })
  end
end
