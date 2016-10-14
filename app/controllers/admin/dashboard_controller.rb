class Admin::DashboardController < Admin::ApplicationController
  skip_load_and_authorize_resource

  def index
  end
end
