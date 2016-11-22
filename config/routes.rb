Rails.application.routes.draw do
  devise_for :users, controllers: {
        sessions: 'users/sessions',
        registrations: "users/registrations"
      }

  resources :chat_rooms, only: [:new, :create, :show, :index]

  resources :posts do
    resources :comments, only: [:create, :destroy]
  end

  resources :bulletins do
    resources :posts
  end

  get '/search' => 'chat_rooms#search'

  post '/exit' => 'chat_rooms#exit'

  mount ActionCable.server => '/cable'

  root 'chat_rooms#index'
end
