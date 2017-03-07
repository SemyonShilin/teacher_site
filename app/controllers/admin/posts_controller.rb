class Admin::PostsController < Admin::ApplicationController
  before_action :init_post, except: [:new, :create, :index]

  add_breadcrumb :root, 'admin_dashboard_path'
  add_breadcrumb :content, ''
  add_breadcrumb :posts, "admin_#{controller_name}_path"

  def index
    @posts = if params[:search]
               Post.order(created_at: :desc).search(params[:search][:q], page: params[:page], per_page: 7)
             else
               Post.order(created_at: :desc).page(params[:page]).per(7)
             end
  end

  def show
    add_breadcrumb @post.id, send("admin_#{controller_name.singularize}_path", @post.id)
  end

  def new
    add_breadcrumb :new, :new_admin_post_path

    @post = AdminUser.current.posts.build
  end

  def edit
    add_breadcrumb @post.id, send("admin_#{controller_name.singularize}_path", @post.id)
    add_breadcrumb :edit, send("edit_admin_#{controller_name.singularize}_path", @post.id)
  end

  def create
    @post = AdminUser.current.posts.build(post_params)

    if @post.save
      redirect_to admin_post_path(@post), notice: 'Успешно создана'
    else
      render 'new'
    end
  end

  def update
    @post.edit

    if @post.update(post_params)
      redirect_to admin_post_path(@post), notice: 'Успешно обновлена'
    else
      render 'edit'
    end
  end

  def destroy
    @post.destroy
    redirect_to admin_posts_path
  end

  def publish
    @post.publish
    @post.save
    flash[:notice] = 'Статья опубликована'
    respond_with :admin, @post, location: [:admin, :posts]
  end

  def unpublish
    @post.unpublish
    @post.save
    flash[:notice] = 'Статья снята с публикации'
    respond_with :admin, @post, location: [:admin, :posts]
  end

  private

  def init_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:id, :title, :content, :content, :admin_user, :file)
  end
end
