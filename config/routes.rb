Rails.application.routes.draw do
  get 'users/index'
  get 'users/show'
  get 'recipes/index'
  get 'recipes/show'
  get 'recipes/new'
  devise_for :users

  root to: 'home#index'

  resources :foods, only: [:index, :show, :new, :create]
  resources :recipes, only: [:index, :show, :new] do
    resources :recipe_foods, only: [:new, :create]
  end
  resources :public_recipes, only: [:public_recipes]
  resources :shopping_list, only: [:shopping_list]
end
