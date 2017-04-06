class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  rescue_from ActiveRecord::RecordNotFound do
    flash[:danger] = 'Cannot find this record...'
    redirect_to root_path
  end

  private

  def current_user
    User.find_by id: cookies.signed[:user_id]
  end

  def user_signed_in?
    current_user.present?
  end

  helper_method :current_user, :user_signed_in?
end
