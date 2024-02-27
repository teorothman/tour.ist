Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"

  get "up" => "rails/health#show", as: :rails_health_check

  get "tours/new", to: "tours#new"
  post "tours", to: "tours#create"
end
