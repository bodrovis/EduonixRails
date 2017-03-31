class EventsController < ApplicationController
  before_action :set_category!
  before_action :set_event!, only: [:show, :edit, :update, :destroy]

  def edit
  end

  def update
    if @event.update_attributes(event_params)
      flash[:success] = "Event #{@event.title} updated!"
      redirect_to category_event_path(@category, @event)
    else
      render :edit
    end
  end

  def destroy
    @event.destroy
    respond_to do |format|
      format.html do
        msg = @event.destroyed? ?
            {success: "Event #{@event.title} removed!"} :
            {danger: "Cannot remove #{@event.title} event..."}
        flash.merge! msg
        redirect_to category_path(@category)
      end
      format.js
    end
    if @event.destroy
      flash[:success] = "Event #{@event.title} removed!"
    else
      flash[:danger] = "Cannot remove #{@event.title} event..."
    end

  end

  def new
    @event = @category.events.build
  end

  def create
    @event = @category.events.build(event_params)
    if @event.save
      flash[:success] = "Event #{@event.title} was added to the #{@category.title}!"
      redirect_to category_event_path(@category, @event)
    else
      render :new
    end
  end

  def show
  end

  private

  def event_params
    params.require(:event).permit(:title, :description, :starts_at, :ends_at)
  end

  def set_category!
    @category = Category.find(params[:category_id])
  end

  def set_event!
    @event = @category.events.find(params[:id])
  end
end