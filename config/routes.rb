Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root "welcome#index"
  namespace :admin do
    get "/", to: "dashboards#welcome"
    resources :invoices, only: [:index, :show, :update]
    resources :merchants, except: :destroy
  end
  
  resources :merchants, only: [:show] do
    get "/dashboard", to: "merchants#show"
    resources :items, only: [:index, :new, :create, :show, :update], :controller => 'merchant_items'
    resources :invoices, only: [:index, :show, :update], :controller => 'merchant_invoices'
  end
  
  resources :items, only: [:edit, :update]

  get "merchants/:id/bulk_discounts", to: "bulk_discounts#index"
end