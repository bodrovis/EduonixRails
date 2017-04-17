Rails.application.routes.draw do
  scope "(:locale)", locale: /#{I18n.available_locales.join('|')}/ do
    resource :enrollments, only: [:create, :destroy]

    resource :sessions, only: [:new, :create, :destroy]

    resources :users

    resources :categories do
      resources :events, except: [:index]
    end

    resources :pages, only: [:index] do
      collection { get 'about' }
    end

    root to: 'categories#index'
  end
end
