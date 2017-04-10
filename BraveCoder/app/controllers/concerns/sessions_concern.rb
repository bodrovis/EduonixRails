module SessionsConcern
  extend ActiveSupport::Concern

  included do
    def sign_in(user)
      cookies.permanent.signed[:user_id] = user.id
    end

    def sign_out
      cookies.delete(:user_id)
    end
  end
end