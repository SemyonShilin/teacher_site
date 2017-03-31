class Admin::ImagesController < Admin::ApplicationController
  respond_to :html, :json, :js

  add_breadcrumb :root, :admin_dashboard_path
  add_breadcrumb :content, ''
  add_breadcrumb :images, "admin_#{controller_name}_path"
  # add_breadcrumb :root, 'admin_dashboard_path'
  # add_breadcrumb :posts, "admin_#{controller_name}_path"

  def index
    @images = if params[:search]
                Image.order(created_at: :desc).search(params[:search][:q], page: params[:page], per_page: 8)
              else
                Image.order(created_at: :desc).page(params[:page]).per(8)
              end
  end

  def show
    @image = Image.find(params[:id])
    respond_with @image
    # add_breadcrumb @image.id, send("admin_#{controller_name.singularize}_path", @image.id)
  end

  def new
    add_breadcrumb :new, :new_admin_image_path

    @image = Image.new
  end

  def create
    @image = Image.new(image_params)
    respond_with @image, status: :created, location: admin_images_path

    # if @image.save
    #   redirect_to admin_images_path, notice: 'Успешно добавлена'
    # else
    #   render 'new'
    # end
  end

  def edit
    @image = Image.find(params[:id])

    add_breadcrumb :edit, send("edit_admin_#{controller_name.singularize}_path", @image.id)
  end

  def update
    @image = Image.find(params[:id]).update(image_params)

    respond_with :admin, @image, status: :updated, location: admin_images_path

    # if @image.update(image_params)
    #   redirect_to admin_images_path, notice: 'Успешно обновлен'
    # else
    #   render 'edit'
    # end
  end

  def destroy
    @image = Image.find(params[:id])
    @image.destroy
    redirect_to admin_images_path
  end

  private

  def image_params
    params.require(:image).permit(:photo, :post_id)
  end
end
