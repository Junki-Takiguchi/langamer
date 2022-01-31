Rails.application.routes.draw do

  root 'recruitments#index'
  devise_for :users, controllers: {
        #registrations: 'users/registrations'
        #sessions: 'users/sessions'
  }
  resources :recruitments
  resources :users, only: [:index, :show]

  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end

end
