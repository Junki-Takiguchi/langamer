Rails.application.routes.draw do

  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  scope "(:locale)", locale: /#{I18n.available_locales.map(&:to_s).join("|")}/ do
    root 'recruitments#index'
    devise_for :users, controllers: {
          registrations: 'users/registrations'
    }
    resources :recruitments do
      collection do
        match 'search', to: 'recruitments#search', via: [:get, :post]
      end
    end
    resources :users, only: [:update, :show]
    resources :friend_relations, only: [:index, :create, :update, :destroy]
    patch 'friend_relation/:id', to: 'friend_relations#index'
    resources :chat_rooms, only: [:index]
    get 'message/:id', to: 'messages#show', as: 'chat_message'
    resources :messages, only: [:get, :create]
  end

  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end

end
