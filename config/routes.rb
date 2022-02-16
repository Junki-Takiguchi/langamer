Rails.application.routes.draw do

  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  root 'recruitments#index'
  devise_for :users, controllers: {
        registrations: 'users/registrations'
  }
  devise_scope :user do
    post 'users/guest_sign_in', to: 'users/sessions#guest_sign_in'
    post 'users/admin_guest_sign_in', to: 'users/sessions#admin_guest_sign_in'
  end
  resources :recruitments do
    collection do
      match 'search', to: 'recruitments#search', via: [:get, :post]
    end
  end

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
