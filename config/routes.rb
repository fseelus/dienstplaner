Rails.application.routes.draw do
  resources :schedules
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :schedules
  resources :shifts


  # Defines the root path route ("/")
  root "schedules#index"

end
