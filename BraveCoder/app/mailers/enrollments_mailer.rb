class EnrollmentsMailer < ApplicationMailer
  def notify(event, user)
    @event = event
    @user = user
    mail to: "#{event.owner.name} <#{event.owner.email}>",
         subject: "A new enrollment for your event #{event.title}"
  end
end