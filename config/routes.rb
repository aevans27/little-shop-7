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
  
  # namespace :merchant do
  #   get "/:merchant_id/"
  # end
  get "/merchants/:merchant_id/dashboard", to: "merchants#show"
  get "/merchants/:merchant_id/items", to: "merchant_items#index"
  get "/merchants/:merchant_id/items/new", to: "merchant_items#new"
  post "/merchants/:merchant_id/items", to: "merchant_items#create"

  get "/merchants/:merchant_id/items/:item_id", to: "merchant_items#show"
  patch "/merchants/:merchant_id/items/:item_id", to: "merchant_items#update"
  get "/merchants/:merchant_id/invoices", to: "merchant_invoices#index"
  get "/merchants/:merchant_id/invoices/:invoice_id", to: "merchant_invoices#show"
  patch "/merchants/:merchant_id/invoices/:invoice_id", to: "merchant_invoices#update"
  
  get "/items/:item_id/edit", to: "items#edit"
  patch "/items/:item_id", to: "items#update"
end
# namespace: admin do 
#   resources: merchants, only [index] 
# end