Rails.application.routes.draw do
  resource :enrollments, only: [:create, :destroy]

  resource :sessions, only: [:new, :create, :destroy]

  resources :users

  resources :categories do
    resources :events, except: [:index]
  end

  resources :pages, only: [:index] do
    collection { get 'about' }
  end

  root to: 'pages#index'
end
