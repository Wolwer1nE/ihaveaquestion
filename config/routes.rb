Rails.application.routes.draw do
  root to: 'questions#index'
  resources :questions, only: %i[index show new create update]

  resources :answers, only: %i[create]
  get '/auth', to: 'auth#index'
  get 'auth/new', to: 'auth#new'
  get 'auth/github', to: 'auth#github'

  get 'home', to: 'home#index'

  get 'chat', to: 'chat#index'
  post 'chat', to: 'chat#message'

end
