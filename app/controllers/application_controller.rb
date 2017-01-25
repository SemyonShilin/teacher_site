class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :set_locale
  before_action :init_feedback

  private

  def set_locale
    I18n.locale = :ru
  end

  def init_feedback
    @feedback = Feedback.new
  end

  def feedback_params
    params.require(:feedback).permit(:subject, :body, :user_email)
  end
end
