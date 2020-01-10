class CancelMailer < ApplicationMailer
  default from: 'from@example.com'

  def cancel_mail(user, event)
    @user = user
    @event = event
    mail to: @user.email, subject: 'イベントキャンセル通知'
  end
end
