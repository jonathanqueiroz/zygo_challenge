Rails.application.routes.draw do
  resources :books do
    get 'search', on: :collection
  end
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root to: 'books#index'
end
