module AuthenticationConcern
  extend ActiveSupport::Concern

  included do
    before_action :authenticate_user!

    private

    def check_admin!
      unless user_signed_in? && current_user.admin?
        flash[:danger] = 'You are not allowed to perform this action...'
        redirect_back fallback_location: root_path
      end
    end

    def require_no_authentication!
      if user_signed_in?
        flash[:danger] = "You are already logged in!"
        redirect_back fallback_location: root_path
      end
    end

    def authenticate_user!
      unless user_signed_in?
        flash[:danger] = "You must be logged in to browse this page!"
        redirect_to new_sessions_path
      end
    end

    def current_user
      User.find_by id: cookies.signed[:user_id]
    end

    def user_signed_in?
      current_user.present?
    end

    helper_method :current_user, :user_signed_in?
  end
end