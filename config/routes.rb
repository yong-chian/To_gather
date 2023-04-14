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
  get "/bookings/confirmed", to: "bookings#confirmed", as: "booking_confirmed"
  get "/bookings/completed", to: "bookings#completed", as: "booking_completed"

  resources :activities do
    resources :bookings, only: [:show, :new, :create, :edit, :update]
    resources :bookings, only: [:destroy], as: :booking_destroy
    member do
      post 'favorite', to: "activities#toggle_favorite"
    end
  end

  resources :bookings, only: :index do
    resources :participant_reviews, only:  [:show, :new, :create, :edit, :update]
  end

  resources :participant_reviews, only: :index

  resources :orders, only: [:show, :create] do
    resources :payments, only: :new
  end

  resources :chatrooms, only: :show do
    resources :messages, only: :create
  end

  resources :favorites, only: [:index]
  # resources :users, only: :index do
  #   member do
  #     post 'favorite', to: "users#toggle_favorite"
  #   end
  # end
end
