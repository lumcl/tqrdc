Rails.application.routes.draw do
  namespace :tqrdc do
    resources :groups do
      get :autocomplete_group_name, :on => :collection
    end
    resources :qheads do
    end
  end

  root to: 'visitors#index'

  devise_for :users

  resources :users do
    get :autocomplete_user_email, :on => :collection
  end

end
