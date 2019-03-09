Rails.application.routes.draw do
  resources :gadgets
  resources :customers
  root to: 'welcome#index'
end
