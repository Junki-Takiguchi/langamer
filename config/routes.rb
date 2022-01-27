Rails.application.routes.draw do

  devise_for :users
  root 'recruitments#index'
  resources :recruitments

  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end

end
