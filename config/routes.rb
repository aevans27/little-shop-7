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
  get "merchants/:id/bulk_discounts/new", to: "bulk_discounts#new"
  post "merchants/:id/bulk_discounts", to: "bulk_discounts#create"
  delete "merchants/:id/bulk_discounts", to: "bulk_discounts#destroy"
  get "merchants/:id/bulk_discounts/:discount_id", to: "bulk_discounts#show"

  get "bulk_discounts/:id/edit", to: "bulk_discounts#edit"
  patch "bulk_discounts/:id", to: "bulk_discounts#update"
end