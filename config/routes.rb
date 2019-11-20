Rails.application.routes.draw do
  root 'appointments#index'
  devise_for :patients

  resources :doctors do
    resources :appointments, only: [:index, :new, :create, :destroy]
  end
end
