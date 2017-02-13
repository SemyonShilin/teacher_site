class ImagesController < ApplicationController
  def index
    @images = Image.all.order(created_at: :desc).page(params[:page]).per(24)
  end

  def show
    @image = Image.find(params[:id])
  end
end
