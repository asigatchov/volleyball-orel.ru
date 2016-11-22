Rails.application.routes.draw do
  devise_for :users do
  end


  resources :articles
  root to: 'articles#show', id: 1
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
