class Admin::UsersController < Admin::ApplicationController
  def index
    @users = User.order(created_at: :desc)
  end

  def ban
    @user = User.find(params[:id]).toggle :banned
    redirect_to action: :index if @user.save
  end
end
