Rails.application.routes.draw do
  get 'shopping_list/index'
  devise_for :users

    resources :recipes, only: %i[index new create destroy show]
    resources :foods, only: %i[index new create destroy]
    resources :users, only: %i[index]
    resources :recipe_foods, only: %i[index new create destroy show edit]
  root "public#index"
end
