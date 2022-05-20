Rails.application.routes.draw do
  devise_for :users
  resources :users do
    resources :recipes, only: %i[index new create destroy show]
    resources :foods, only: %i[index new create destroy]
  end

  root "users#index"
end
