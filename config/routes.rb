Rails.application.routes.draw do
  get 'recipe_foods/edit'
  get 'recipe_foods/new'
  get 'users/index'
  get 'users/show'
  get 'recipes/index'
  get 'recipes/show'
  get 'recipes/new'
  get 'public_recipes', to: 'recipes#public_recipes'

  devise_for :users
  resource :user
  root "users#index"

  resources :foods, only: [:index, :show, :new, :create, :destroy]
  resources :recipes, only: [:index, :show, :create, :new, :destroy] do
    resources :recipe_foods, only: [:new]

  end
  resources :shop, only: [:index]
  resources :recipe_foods, only: [ :destroy, :create]
end
