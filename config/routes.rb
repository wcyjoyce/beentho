Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :surveys, only: [:new, :create, :index]
end
