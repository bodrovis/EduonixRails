class EnrollmentsJob < ApplicationJob
  queue_as :default

  def perform(enrollment)
    EnrollmentsMailer.notify(enrollment.event, enrollment.user).deliver_now
  end
end