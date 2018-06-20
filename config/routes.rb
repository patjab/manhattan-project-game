Rails.application.routes.draw do
  get 'static/rules'
  root 'matches#index'

  resources :matches, only: [:index, :show, :new, :create]

  get 'signup', to: 'users#new', as: 'signup'
  get 'users/', to: 'user#new', as: 'users'

  get 'users/:id', to: 'users#show', as: 'user'

  post 'users/', to: 'users#create'

  post 'wrong', to: 'matches#wrong', as: 'wrong_answer'
  post 'correct', to: 'matches#correct', as: 'correct_answer'
  get 'match/:id', to: 'matches#show', as: 'show_match'

  get 'login', to: 'sessions#new', as: 'login'
  post 'login', to: 'sessions#create', as: 'session'
  delete 'logout', to: 'sessions#destroy', as: 'logout'

  get 'rules', to: 'static#rules', as: 'rules'

end
