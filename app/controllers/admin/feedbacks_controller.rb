class Admin::FeedbacksController < Admin::ApplicationController
  # respond_to :html, :js
  add_breadcrumb :root, 'admin_dashboard_path'
  add_breadcrumb :feedbacks, ''

  def reply
    @feedback = Feedback.find(params[:id])
    @feedback.assign_attributes(feedback_params.merge(admin_user: current_admin_user, status: 'replied'))

    respond_to do |format|
      if @feedback.save
        UserMailer.feedback_reply(@feedback).deliver
        format.html do
          redirect_to admin_feedbacks_path, notice: 'Сообщение отправлено!' #t("feedback_succ")
        end
        format.js {}
      else
        format.html{ render }
        format.js {}
      end
    end

    # if @feedback.save
    #   UserMailer.feedback_reply(@feedback).deliver
    #   redirect_to admin_feedbacks_path, notice: 'Сообщение отправлено!' #t("feedback_succ")
    # else
    #   render
    # end
  end

  def index
    @feedbacks = if params[:search]
                   Feedback.order(:status, created_at: :desc).search(params[:search][:q], page: params[:page], per_page: 7)
                 else
                   Feedback.order(:status, created_at: :desc)
                 end
  end

  def show
    @feedback =Feedback.find(params[:id])
  end

  private

  def feedback_params
    params.require(:feedback).permit(:admin_message)
  end
end
