Rails.application.routes.draw do

  root 'posts#index'
  
  resources :posts do
    resources :users
  end
  
  devise_for :users
  
  resources :follower, only: [:create, :destroy]  
  
  get 'users/:id' => 'users#show'
  get 'users' => 'users#index'
end