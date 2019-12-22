Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users
  root 'events#index'

  resources :events do
    collection do
      post :confirm
    end
    member do
      patch :confirm
    end
  end

  resources :conversations do
    resources :messages
  end

  resources :participant_managements, only: [:create, :destroy]
end
