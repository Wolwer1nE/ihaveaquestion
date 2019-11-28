Rails.application.routes.draw do
  root to: 'questions#index'
  resources :questions, only: [:index, :show]

  get '/auth', to: 'auth#index'
  get 'auth/new', to: 'auth#new'
  get 'auth/github', to: 'auth#github'
end
