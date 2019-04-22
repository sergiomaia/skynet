Rails.application.routes.draw do
  resources :tasks
  devise_for :users
  resources :packages
  resources :comments
  resources :protocols
  resources :payments
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
