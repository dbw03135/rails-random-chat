Rails.application.routes.draw do
  devise_for :users

  resources :chat_rooms, only: [:new, :create, :show, :index, :destroy]

  get '/search' => 'chat_rooms#search'

  mount ActionCable.server => '/cable'

  root 'chat_rooms#index'
end
