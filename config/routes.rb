Rails.application.routes.draw do
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
end
