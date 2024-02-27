Rails.application.routes.draw do
  devise_for :users
  root to: "tours#index"

  get "up" => "rails/health#show", as: :rails_health_check

  resources :tours, only: [:show] do
    resources :bookings, only: [:new, :create, :show]
  end
end

#    tour_bookings POST   /tours/:tour_id/bookings(.:format)              bookings#create
# new_tour_booking GET    /tours/:tour_id/bookings/new(.:format)          bookings#new
#     tour_booking GET    /tours/:tour_id/bookings/:id(.:format)          bookings#show
