Rails.application.routes.draw do
  namespace :tqrdc do
    resources :scores do
      get :supplier_entry, :on => :collection
      get :supplier_enquiry, :on => :collection
      post :update_scores, :on => :collection
      get :submit, :on => :member
    end

    resources :groups do
      get :autocomplete_group_name, :on => :collection
    end
    resources :qheads
    resources :qlines  #browser若要訪問，就要加上這段
    resources :flows
    resources :suppliers do
      get :autocomplete_supplier_name, :on => :collection
    end
    resources :orders
    resources :order_groups
    resources :order_lines
  end

  root to: 'visitors#index' #首頁

  devise_for :users

  resources :users do
    get :autocomplete_user_email, :on => :collection
  end

end
