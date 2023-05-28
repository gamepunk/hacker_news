Rails.application.routes.draw do

  devise_for :users

  get 'users/:id', to: "users#show"
  post 'users/:id', to: "users#edit"
  get 'users/update', to: "users#update"

  # devise_for :users, controllers: {
  #   sessions: 'users/sessions'
  # }

  get "/guidelines", to: "pages#guidelines"
  get "/faq", to: "pages#faq"
  get "/lists", to: "pages#lists"
  get "/API", to: "pages#api"
  get "/security", to: "pages#security"
  get "/legal", to: "pages#legal"
  get "/contact", to: "pages#contact"

  get "/newest", to: "items#newest"

  get "/comments", to: "comments#index"

  resources :items do
    resources :comments, only: [ :show, :create, :destroy ]
  end

  resources :comments, only: [ :show, :create, :destroy ]

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "items#index"
end
