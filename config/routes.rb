Rails.application.routes.draw do
  devise_for :users
  resources :gadgets
  resources :gadget_allocations

  resources :customers do
    resources :comments, only: [:create, :destroy]
  end

  root to: 'welcome#index'
end
