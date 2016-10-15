class PostsController < ApplicationController
  def index
    @posts = Post.includes(:translations).order(created_at: :desc)
  end

  def show
    @post = Post.find(params[:id])

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

  def post_params
    params.require(:post).permit(:file)
  end
end
