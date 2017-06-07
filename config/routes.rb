Rails.application.routes.draw do
  get 'exercises/update'

  root 'pages#home'

  resources :workouts
  resources :exercises, only: [:update]

  devise_for :users, controllers: {sessions: 'users/sessions', registrations: 'users/registrations'}
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
