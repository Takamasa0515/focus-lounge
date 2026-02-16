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
  resources :categories, :only => [:index, :create, :update, :destroy]
  get "up" => "rails/health#show", as: :rails_health_check
  get '/users/:user_name', to: 'users#show'
end
