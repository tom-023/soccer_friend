class EventMailer < ApplicationMailer
  default from: 'from@example.com'

  def event_mail(user, event)
    @user = user
    @event = event
    mail to: @user.email, subject: 'イベント参加者通知'
  end
end
