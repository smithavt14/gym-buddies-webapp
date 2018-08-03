Rails.application.routes.draw do

  get 'booking/new'
  get 'booking/create'
  get 'booking/destroy'
  root to: 'workouts#index'
  devise_for :users
  resources :workouts do
    resources :bookings, only: [ :index, :show, :new, :create, :destroy ]
  end
  resources :users, except: [:index]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
