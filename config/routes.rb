Rails.application.routes.draw do
  get 'static/rules'
  root 'matches#index'

  resources :matches, only: [:index, :new, :create]

  get 'signup', to: 'users#new', as: 'signup'
  get 'users/', to: 'users#index', as: 'users'
  get 'users/:id/edit', to: 'users#edit', as: 'edit_user'

  patch 'users/:id', to: 'users#update'

  get 'users/:id', to: 'users#show', as: 'user'
  post 'users/', to: 'users#create'

  get 'matches/:id', to: 'matches#show', as: 'match'
  post 'matches/:id', to: 'matches#evaluate', as: 'evaluate'

  delete 'matches/:id', to: 'matches#destroy', as: 'destroy_match'

  get 'login', to: 'sessions#new', as: 'login'
  post 'login', to: 'sessions#create', as: 'session'
  delete 'logout', to: 'sessions#destroy', as: 'logout'

  get 'rules', to: 'static#rules', as: 'rules'

  post 'espionage', to: 'matches#espionage', as: 'espionage'
end
