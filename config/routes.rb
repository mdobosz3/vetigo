Rails.application.routes.draw do
  root "home#index"
  resources :appointments, only: [ :new, :create, :index ]

  devise_for :users
  mount_avo
  get "up" => "rails/health#show", as: :rails_health_check
end
