Rails.application.routes.draw do

  root 'recruitments#index'
  devise_for :users, controllers: {
        #registrations: 'users/registrations'
        #sessions: 'users/sessions'
  }
  resources :recruitments
  resources :users, only: [:index, :update, :show]
  resources :friend_relations, only: [:create, :update, :destroy]

  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end

end
