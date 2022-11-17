Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: "users/registrations"
  }

  root to: "items#index"
  resources :users, only: [:show, :update]
  resources :items do

    get '/photo/category', to: "photos#category"
    
  end
end
