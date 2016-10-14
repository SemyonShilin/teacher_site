class PostsController < ApplicationController
  def index
    @posts = Post.includes(:translations).order(created_at: :desc)
  end

  def show
    @post = Post.find(params[:id])
  end
end
