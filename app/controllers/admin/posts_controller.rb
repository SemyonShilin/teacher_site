class Admin::PostsController < Admin::ApplicationController
  add_breadcrumb :root, 'admin_dashboard_path'
  add_breadcrumb :content, ''
  add_breadcrumb :posts, "admin_#{controller_name}_path"

  def index
    @posts = Post.all.order(created_at: :desc)
  end

  def show
    @post = Post.find(params[:id])

    add_breadcrumb @post.id, send("admin_#{controller_name.singularize}_path", @post.id)
  end

  def new
    add_breadcrumb :new, :new_admin_post_path

    @post = AdminUser.current.posts.build
  end

  def edit
    @post = Post.find(params[:id])

    add_breadcrumb @post.id, send("admin_#{controller_name.singularize}_path", @post.id)
    add_breadcrumb :edit, send("edit_admin_#{controller_name.singularize}_path", @post.id)
  end

  def create
    @post = AdminUser.current.posts.build(post_params)

    if @post.save
      redirect_to admin_post_path(@post), notice: 'Успешно создан'
    else
      render 'new'
    end
  end


  def update
    @post = Post.find(params[:id])

    if @post.update(post_params)
      redirect_to admin_posts_path, notice: 'Успешно обновлен'
    else
      render 'edit'
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to admin_posts_path
  end

  private

  def post_params
    params.require(:post).permit(:title, :title, :content, :content, :admin_user, :file, image_ids: [])
  end
end
