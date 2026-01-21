Rails.application.routes.draw do
  get 'dashboards/show'
  get "/" => "top#index"
  get "users/show"
  devise_for :users, controllers: {
    sessions: "users/sessions"
  }
  resources :users, :only => [:show]
  resources :work_sessions, only: [:create] do
    member do
      patch :end
    end
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
  get '/users/:user_name', to: 'users#show'
end
