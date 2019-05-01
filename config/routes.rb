Rails.application.routes.draw do
  resources :tasks
  resources :packages
  resources :comments
  resources :protocols
  resources :payments

  devise_for :users, controllers: { :registrations => "registrations" }
  as :user do
    get "/register", to: "registrations#new", as: "register"
  end

  resource :payments do
    post :create_monthly_payments
  end

  resources :gadgets do
    get :dealloc
  end
  resources :gadget_allocations

  resources :customers do
    get :custom_table, on: :collection
    resources :comments, only: [:create, :destroy]
  end

  root to: 'welcome#index'
end
