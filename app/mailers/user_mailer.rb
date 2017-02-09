class UserMailer < ApplicationMailer
  def feedback_new(feedback)
    @body = feedback.body

    mail(to: feedback.user_email, subject: feedback.subject) do |format|
      format.html { render 'template' }
    end
  end

  def feedback_reply(feedback)
    email = feedback&.user&.email || feedback.user_email
    @body = feedback.admin_message

    mail(:to => email, :subject => feedback.subject) do |format|
      format.html { render 'template' }
    end
  end
end
