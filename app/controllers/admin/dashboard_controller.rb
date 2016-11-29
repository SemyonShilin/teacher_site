class Admin::DashboardController < Admin::ApplicationController
  skip_load_and_authorize_resource
  add_breadcrumb 'Главная страница', :admin_dashboard_path

  def index
  end
end
