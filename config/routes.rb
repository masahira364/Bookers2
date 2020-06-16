Rails.application.routes.draw do
  get 'top/home'
  	get 'home/about'
  root 'top#home'

  devise_for :users

  resources :books
  resources :users, only: [:index, :show, :edit, :update, :destroy]

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
