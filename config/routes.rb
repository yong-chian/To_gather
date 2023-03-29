Rails.application.routes.draw do

  # get "users/add_interest", to: "users#add_interest"
  devise_for :users, controllers: { registrations: "users/registrations" }
  devise_scope :user do
    get "users/add_interest", to: "users/registrations#add_interest"
    patch "users/update_interest", to: "users/registrations#update_interest"
  end
  root to: "pages#home"
  get "/about", to: "pages#about"
  get "/contact_us", to: "pages#contact_us"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  resources :activities do
    resources :bookings, only: [:show, :new, :create, :edit, :update]
    resources :bookings, only: [:destroy], as: :booking_destroy
  end
  resources :bookings, only: :index
  resources :activities, only: :index do
    member do
      post 'favorite', to: "activities#toggle_favorite"
    end
  end
  resources :favorites, only: [:index]

  # resources :users, only: :index do
  #   member do
  #     post 'favorite', to: "users#toggle_favorite"
  #   end
  # end
end
