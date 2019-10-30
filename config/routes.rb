Rails.application.routes.draw do
  get 'users/new'
  devise_for :users
 
 # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
 root "room#top"
 get "home/about" => "room#about"
 resources :books, only: [:new, :create, :index, :show, :edit, :destroy, :update]
 resources :users, only: [:update, :show, :edit, :index]
end

