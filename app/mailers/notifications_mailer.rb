class NotificationsMailer < ActionMailer::Base

  default :from => "no-reply@roguerails.com"
  default :to => "info@roguerails.com"

  def new_message(message)
    @message = message
    mail(:subject => "Rogue Rails website: #{message.subject}")
  end

end