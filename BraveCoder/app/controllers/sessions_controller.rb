class SessionsController < ApplicationController
  include SessionsConcern

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