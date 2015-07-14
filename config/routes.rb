Rails.application.routes.draw do
  namespace :tqrdc do
    resources :groups
  end
  root to: 'visitors#index'
  devise_for :users
  resources :users
end
