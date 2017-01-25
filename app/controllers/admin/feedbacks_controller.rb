class Admin::FeedbacksController < Admin::ApplicationController
  def reply
    @feedback = Feedback.find(params[:id])
    @feedback.assign_attributes(feedback_params.merge(admin_user: current_admin_user, status: 'replied'))

    if @feedback.save
      UserMailer.feedback_reply(@feedback).deliver
      redirect_to admin_feedbacks_path, notice: 'Сообщение отправлено!' #t("feedback_succ")
    else
      render
    end
  end

  def index
    @feedbacks = Feedback.all.order(:status)
  end

  def show
    @feedback =Feedback.find(params[:id])
  end

  private

  def feedback_params
    params.require(:feedback).permit(:admin_message)
  end
end
