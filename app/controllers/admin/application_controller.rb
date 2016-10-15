class Admin::ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  respond_to :html

  layout 'admin/application'

  before_action :authenticate_admin_user!
  before_action :set_current_admin
  before_action :set_locale

  load_and_authorize_resource

  def current_ability
    @current_ability ||= Ability.new(current_admin_user)
  end

  private

  def set_current_admin
    AdminUser.current = current_admin_user
  end

  def set_locale
    I18n.locale = :ru
  end
end
