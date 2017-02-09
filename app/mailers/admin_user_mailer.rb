class AdminUserMailer < ApplicationMailer
  def notification_admin_user(user, feedback)
    @body = feedback.body
    admin_users = AdminUser.all

    from = feedback&.user_email || user.email

    mail(from: from, subject: feedback.subject, to: admin_users.pluck(:email)) do |format|
      format.html { render 'template' }
    end
  end
end
