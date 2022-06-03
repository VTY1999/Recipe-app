Rails.application.routes.draw do
  devise_for :users

  root to: 'home#index'

  resources :foods, only: [:index, :show, :new, :create, :destroy]
  resources :recipes, only: [:index, :show, :new] do
    resources :recipe_foods, only: [:new, :create]
  end
  resources :public_recipes, only: [:public_recipes]
  resources :shop, only: [:index]
end
