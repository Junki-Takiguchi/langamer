Rails.application.routes.draw do

  root 'recruitments#index'
  resources :recruitments

  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end

end
