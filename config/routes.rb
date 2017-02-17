Rails.application.routes.draw do
  get '/games/all', to: 'games#all'
  resources :games


  resources :members
  resources :teams
  devise_for :users do
  end

  resources :articles
  resources :teams
  resources :teams do
    resources :members
  end

  root to: 'articles#show', id: 1
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
