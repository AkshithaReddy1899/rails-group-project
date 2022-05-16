Rails.application.routes.draw do
  resources :users do
    resources :foods
    resources :recipes
  end

  root "users#index"
end
