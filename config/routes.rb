Rails.application.routes.draw do
  devise_for :users
  root to: "tours#index"

  get "up" => "rails/health#show", as: :rails_health_check

  resources :tours, only: [:show, :new, :create, :edit, :update] do
    resources :bookings, only: [:new, :create]
  end

  resources :bookings, only: [:show]

  get 'my_tours', to: 'tours#my_tours', as: :my_tours
  get 'profile', to: 'users#show', as: :profile
end

#       tour GET    /tours/:id(.:format)                                  tours#show

#    tour_bookings POST   /tours/:tour_id/bookings(.:format)              bookings#create
# new_tour_booking GET    /tours/:tour_id/bookings/new(.:format)          bookings#new
#     tour_booking GET    /tours/:tour_id/bookings/:id(.:format)          bookings#show
