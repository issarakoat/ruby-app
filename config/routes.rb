Rails.application.routes.draw do
  resources :posts do
    resources :comments
  end
  devise_for :users
  resources :todos do 
    member do
      patch :complete
      patch :incomplete
    end
  end
  resources :users, only: [:index, :edit, :show, :update]
  get 'home/index'
  get 'home/activity'
  root 'home#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
