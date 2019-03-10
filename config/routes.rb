Rails.application.routes.draw do
  devise_for :users
  resources :gadgets
  resources :customers
  root to: 'welcome#index'
end
