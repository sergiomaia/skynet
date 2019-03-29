Rails.application.routes.draw do
  devise_for :users
  resources :packages
  resources :comments
  resources :gadgets do
    get :dealloc
  end
  resources :gadget_allocations

  resources :customers do
    resources :comments, only: [:create, :destroy]
  end

  root to: 'welcome#index'
end
