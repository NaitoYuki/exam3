Rails.application.routes.draw do

  get 'notifications/index'

  root 'top#index'

  resources :topics do
    resources :comments
    post :confirm, on: :collection
  end

  devise_for :users, controllers: {
    registrations: "users/registrations",
    omniauth_callbacks: "users/omniauth_callbacks"
  }

  resources :users, only: [:index, :show]

  resources :relationships, only: [:create, :destroy]

  resources :conversations do
    resources :messages
  end

  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'

  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end

end
