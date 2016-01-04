class MessagesMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.messages_mailer.notify.subject


  # notify(@user.id, current_user.id)
  def notify(message_id)
    @message = Message.find(message_id)
    # @from = @message.from
    @user_from = User.find(@message.from)
    # @to = @message.to
    @user_to = User.find(@message.to)
    mail(to: @user_to.email, subject: 'You received a new message from MOBEEAS')
  end
end
