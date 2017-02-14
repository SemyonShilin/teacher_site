class Admin::UsersController < Admin::ApplicationController
  add_breadcrumb :root, 'admin_dashboard_path'
  add_breadcrumb :users, ''

  def index
    @users = if params[:search]
               User.order(created_at: :desc).search(params[:search][:q], page: params[:page], per_page: 7)
             else
               User.order(created_at: :desc)
             end
  end

  def ban
    @user = User.find(params[:id]).toggle :banned
    redirect_to action: :index if @user.save
  end
end
