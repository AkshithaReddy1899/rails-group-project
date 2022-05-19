Rails.application.routes.draw do
  get 'shopping_list/index'
  # get 'public/index'
  devise_for :users
  resources :users do
    resources :recipes, only: %i[index new create destroy show]
    resources :foods, only: %i[index new create destroy]
  end

  root "public#index"
end
