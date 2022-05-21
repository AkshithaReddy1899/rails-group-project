Rails.application.routes.draw do
  devise_for :users

    
    resources :foods, only: %i[index new create destroy]  
    resources :users, only: %i[index]

    resources :recipes, only: %i[index new create destroy show] do
      resources :recipe_foods, only: %i[index new create destroy show edit]
      resources :shopping_list, only: %i[index]
    end
  root "public#index"
end
