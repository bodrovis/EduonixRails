Rails.application.routes.draw do
  resources :categories

  resources :pages, only: [:index] do
    collection { get 'about' }
  end

  root to: 'pages#index'
end
