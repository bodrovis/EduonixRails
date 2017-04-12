class EventsMailer < ApplicationMailer
  default to: Proc.new {
    User.admins.pluck(:email, :name).map { |el| "#{el[1]} <#{el[0]}>" }
  }
  # [ ['john@example.com', 'John'], ['ilya@example.com', 'Ilya'] ]
  # [ 'John <john@example.com>', 'Ilya <ilya@example.com>' ]

  def notify_admins(event)
    @event = event
    mail subject: "A new event #{event.title} was created"
  end
end