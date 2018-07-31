Rails.application.routes.draw do

  devise_for :users
  root to: 'workouts#index'
  resources :workouts do
    resources :bookings, only: [ :index, :show, :new, :create, :destroy ]
  end
  resources :users, except: [:index]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
