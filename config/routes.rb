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

 resources :foods, only: [:index, :show, :new, :create, :destroy]
  resources :recipes, only: [:index, :show, :create, :new, :destroy] do
    resources :recipe_foods, only: [:new]

  end
  resources :recipe_foods, only: [ :destroy, :create]


  root "users#index"

  resource :user

  get 'foods/index' , to: 'foods#index'
  get 'foods' , to: 'foods#index'
  get 'foods/show' , to: 'foods#show'
  get 'foods/new' , to: 'foods#new'
  get 'foods/delete' , to: 'foods#delete'
  get 'general_shopping_list' , to: 'foods#list'

  resource :foods, only: [:index, :show, :new, :create]
end
