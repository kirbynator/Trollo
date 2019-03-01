Rails.application.routes.draw do
  devise_for :users
  root "boards#index"
  resources :users

resources :users do
  resources :boards
end

resources :boards do
  resources :lists
end


resources :lists do
  resources :tasks
end

resources :boards do
  resources :lists do
    resources :tasks
  end
end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
