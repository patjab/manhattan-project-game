Rails.application.routes.draw do
  root 'sessions#new'

  resources :matches, only: [:index, :show, :new, :create]

  get 'signup', to: 'nations#new', as: 'signup'
  get 'nations/', to: 'nation#new', as: 'nations'

  get 'nations/:id', to: 'nations#show', as: 'nation'

  post 'nations/', to: 'nations#create'

  post 'wrong', to: 'matches#wrong', as: 'wrong_answer'
  post 'correct', to: 'matches#correct', as: 'correct_answer'

  get 'login', to: 'sessions#new', as: 'login'
  post 'login', to: 'sessions#create', as: 'session'
  delete 'logout', to: 'sessions#destroy', as: 'logout'


end
