class EnrollmentsController < ApplicationController
  before_action :set_event!
  before_action :check_enrolled!, only: :destroy
  before_action :check_not_enrolled!, only: :create

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

  def check_enrolled!
    unless @event.participant? current_user
      flash[:danger] = "You are not enrolled for this event!"
      redirect_back fallback_location: root_path
    end
  end

  def check_not_enrolled!
    if @event.participant? current_user
      flash[:danger] = "You are already enrolled for this event!"
      redirect_back fallback_location: root_path
    end
  end

  def set_event!
    @event = Event.find(params[:event_id])
  end
end