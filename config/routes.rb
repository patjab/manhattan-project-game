Rails.application.routes.draw do
  get 'signup', to: 'nations#new', as: 'signup'
  get 'nations/:id', to: 'nations#show', as: 'nation'

  post 'nations/', to: 'nations#create'

  get 'login', to: 'sessions#new', as: 'login'
  post 'login', to: 'sessions#create', as: 'session'
  delete 'logout', to: 'sessions#destroy', as: 'logout'

end
