Rails.application.routes.draw do

  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  root 'recruitments#index'
  devise_for :users, controllers: {
        registrations: 'users/registrations'
        #sessions: 'users/sessions'
  }
  resources :recruitments
  get 'recruitments/search'
  resources :users, only: [:index, :update, :show]
  resources :friend_relations, only: [:index, :create, :update, :destroy]
  patch 'friend_relation/:id', to: 'friend_relations#index'
  resources :chat_rooms, only: [:index]

  get 'message/:id', to: 'messages#show', as: 'chat_message'
  resources :messages, only: [:get, :create]

  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end

end
