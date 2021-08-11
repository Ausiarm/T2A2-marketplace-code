Rails.application.routes.draw do
  resources :orders
  get 'foundry/page', to: "foundry#page"
  resources :listings
  devise_for :users
  root 'home#page'
  get "/payments/success", to: "payments#success"
  post "/payments/webhook", to: "payments#webhook"
  get "/restricted/restricted", to: "restricted#restricted", as: "restricted"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
