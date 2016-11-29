class Admin::ImagesController < Admin::ApplicationController
  add_breadcrumb 'Главная страница', :admin_dashboard_path
  add_breadcrumb 'Изображения', :admin_images_path

  def index
    @images = Image.all.order(created_at: :desc)
  end

  def show
    @image = Image.find(params[:id])

    add_breadcrumb @image.id, send("admin_#{controller_name.singularize}_path", @image.id)
  end

  def new
    add_breadcrumb 'Новое Изображение', :new_admin_image_path

    @image = Image.new
  end

  def create
    @image = Image.new(image_params)

    if @image.save
      redirect_to admin_images_path, notice: 'Успешно добавлена'
    else
      render 'new'
    end
  end

  def edit
    @image = Image.find(params[:id])

    add_breadcrumb "Редактирование #{@image.id} поста", send("edit_admin_#{controller_name.singularize}_path", @image.id)
  end

  def update
    @image = Image.find(params[:id])

    if @image.update(image_params)
      redirect_to admin_images_path, notice: 'Успешно обновлен'
    else
      render 'edit'
    end
  end

  def destroy
    @image = Image.find(params[:id])
    @image.destroy
    redirect_to admin_images_path
  end

  private

  def image_params
    params.require(:image).permit(:photo)
  end
end
