Rails.application.routes.draw do
  devise_for :users
  resources :scores
  resources :teams
  resources :players
  resources :games


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
