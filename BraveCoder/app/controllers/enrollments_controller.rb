class EnrollmentsController < ApplicationController
  before_action :set_event!

  def create
    @event.users << current_user
    flash[:success] = "You have enrolled for the #{@event.title}!"
    redirect_back fallback_location: category_event_path(@event.category, @event)
  end

  def destroy
    @event.users.destroy current_user
    flash[:success] = "You have disenrolled from the #{@event.title}!"
    redirect_back fallback_location: category_event_path(@event.category, @event)
  end

  private

  def set_event!
    @event = Event.find(params[:event_id])
  end
end