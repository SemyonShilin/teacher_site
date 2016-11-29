class ImagesController < ApplicationController
  def index
    @images = Image.all.order(created_at: :desc)
  end

  def show
    @image = Image.find(params[:id])
  end
end
