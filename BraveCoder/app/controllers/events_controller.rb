class EventsController < ApplicationController
  before_action :set_category!
  before_action :set_event!, only: [:show, :edit, :update, :destroy]
  before_action :check_owner!, only: [:edit, :update, :destroy]

  def edit
  end

  def update
    if @event.update_attributes(update_event_params)
      flash[:success] = t '.success', title: @event.title
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
            {success: t('.success', title: @event.title)} :
            {danger: t('.failure', title: @event.title)}
        flash.merge! msg
        redirect_to category_path(@category)
      end
      format.js
    end
  end

  def new
    @event = @category.events.build
  end

  def create
    @event = @category.events.build(create_event_params)
    if @event.save
      flash[:success] = t('.success', event: @event.title, category: @category.title)
      redirect_to category_event_path(@category, @event)
    else
      render :new
    end
  end

  def show
  end

  private

  def create_event_params
    params.require(:event).permit(:title, :description, :starts_at, :ends_at).merge(owner: current_user)
  end

  def update_event_params
    params.require(:event).permit(:title, :description, :starts_at, :ends_at)
  end

  def check_owner!
    unless @event.owned_by?(current_user)
      flash[:danger] = t('common.flash.not_permitted')
      redirect_back fallback_location: root_path
    end
  end

  def set_category!
    @category = Category.find(params[:category_id])
  end

  def set_event!
    @event = @category.events.find(params[:id])
  end
end