Rails.application.routes.draw do

  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  root 'recruitments#index'
  devise_for :users, controllers: {
        registrations: 'users/registrations'
        #sessions: 'users/sessions'
  }
  resources :recruitments
  resources :users, only: [:index, :update, :show]
  resources :friend_relations, only: [:create, :update, :destroy]

  get 'message/:id', to: 'messages#show', as: 'chat_message'
  resources :messages, only: [:create]

  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end

end
