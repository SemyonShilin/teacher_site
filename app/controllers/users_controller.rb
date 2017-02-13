class UsersController < ApplicationController
  before_action :authenticate_user!, except: :feedback

  def show
  end

  def feedback
    @feedback = current_user ? current_user.feedbacks.build(feedback_params) : Feedback.new(feedback_params)

    if @feedback.save
        UserMailer.feedback_new(@feedback).deliver
        AdminUserMailer.notification_admin_user(current_user, @feedback).deliver
        flash.now[:notice] = 'Сообщение отправлено'
    end
  end
end
