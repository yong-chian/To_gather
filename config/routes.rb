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

  resources :activities do
    resources :bookings, only: [:show, :new, :create, :edit, :update] do
      resources :host_reviews, only: [:new, :create, :show, :edit, :update, :destroy]
      resources :participant_reviews, only: [:new, :create, :show, :edit, :update, :destroy]
    end
    resources :bookings, only: [:destroy], as: :booking_destroy
  end

  resources :bookings, only: :index
end
