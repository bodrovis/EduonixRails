class CategoriesController < ApplicationController
  before_action :check_admin!, except: [:show, :index]
  before_action :set_category!, only: [:edit, :update, :show, :destroy]

  def destroy
    @category.destroy
    respond_to do |format|
      format.js
    end
  end

  def show
    @events = @category.events.order(created_at: :desc)
  end

  def edit
  end

  def update
    if @category.update_attributes(category_params)
      flash[:success] = "Category #{@category.title} updated!"
      redirect_to categories_path
    else
      render :edit
    end
  end

  def index
    @categories = Category.order(created_at: :desc)
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      flash[:success] = 'Category added!'
      redirect_to categories_path
    else
      render :new
    end
  end

  private

  def category_params
    params.require(:category).permit(:title, :description)
  end

  def set_category!
    @category = Category.find(params[:id])
  end
end