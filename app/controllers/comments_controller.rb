class CommentsController < ApplicationController
  def create
    @comment = Post.find(params[:post_id]).comments.build(comment_params)

    if @comment.save
      render json: @comment.as_json(include: { user: { only: [:id, :name, :email] }})
    else
      render json: @comment.errors, status: :unprocessable_entity
    end
  end

  def update
    @comment = Comment.find(params[:id])

    if @comment.update(comment_params)
      render json: @comment.as_json(include: { user: { only: [:id, :name, :email] }})
    else
      render json: @comment.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    head :no_content
  end

  private

  def comment_params
    params.require(:comment).permit(:user, :post, :body, :post_id, :user_id)
  end
end
