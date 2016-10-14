class Admin::PostsController < Admin::ApplicationController
  def index
    @posts = Post.all.order(created_at: :desc)
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = AdminUser.current.posts.build
  end

  def create
    @post = AdminUser.current.posts.build(post_params)

    if @post.save
      redirect_to admin_post_path(@post), notice: 'Успешно создан'
    else
      render 'new'
    end
  end

  def edit
    @post = Post.find(params[:id])
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
    params.require(:post).permit(:title, :title, :content, :content, :admin_user, :file)
  end
end