class SessionsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:new, :create]
  before_action :require_no_authentication!, only: [:new, :create]

  include SessionsConcern

  def destroy
    sign_out
    flash[:success] = "See you!"
    redirect_to new_sessions_path
  end

  def new
  end

  def create
    @user = User.from_email_password(params[:session][:email], params[:session][:password])
    if @user
      sign_in @user
      flash[:success] = "Welcome back, #{@user.name}!"
      redirect_to root_path
    else
      flash.now[:danger] = "Incorrect email and/or password..."
      render :new
    end
  end
end