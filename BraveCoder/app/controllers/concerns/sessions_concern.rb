module SessionsConcern
  extend ActiveSupport::Concern

  included do
    def sign_in(user)
      cookies.permanent.signed[:user_id] = user.id
    end
  end
end