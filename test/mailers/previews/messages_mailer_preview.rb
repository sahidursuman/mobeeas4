# Preview all emails at http://localhost:3000/rails/mailers/messages_mailer
class MessagesMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/messages_mailer/notify
  def notify
    MessagesMailer.notify
  end

end
