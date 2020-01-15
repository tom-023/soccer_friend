Rails.application.routes.draw do
  root 'events#index'
  # get 'users/show'
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'

  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end

  devise_for :users, controllers: { registrations: 'users/registrations',
                                    omniauth_callbacks: 'users/omniauth_callbacks'
                                  }

  resources :users, only: [:show]

  resources :events do
    collection do
      post :confirm
      patch :confirm # confirm後のupdateに必要
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
