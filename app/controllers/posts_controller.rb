class PostsController < ApplicationController
  def index
    @posts = Post.where(status: :published).order(created_at: :desc).page(params[:page]).per(7)
    @last_comments = Comment.all.order(created_at: :desc).first(3)
  end

  def show
    @post = Post.find(params[:id])
    @comments = @post.comments.order(created_at: :desc)
                  .as_json(include: { user: { only: [:id, :name, :email, ] }})

    respond_to do |format|
      format.html
      format.doc do
        send_data @post.file,
                  type: 'application/doc',
                  # filename: "#{@post.title}.doc",
                  disposition: :inline
      end
      format.docx do
        send_data @post.file,
                  type: 'application/docx',
                  filename: "#{@post.title}.docx",
                  disposition: :inline
      end
      format.pdf do
        send_data @post.file,
                  type: 'application/pdf',
                  # filename: "#{@post.title}.pdf",
                  disposition: :inline
      end
    end
  end

  private

  def post_params
    params.require(:post).permit(:file)
  end
end
