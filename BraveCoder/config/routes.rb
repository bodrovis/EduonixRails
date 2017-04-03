Rails.application.routes.draw do
  resources :sessions

  resources :users

  resources :categories do
    resources :events, except: [:index]
  end

  resources :pages, only: [:index] do
    collection { get 'about' }
  end

  root to: 'pages#index'
end
