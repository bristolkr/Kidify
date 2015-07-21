Rails.application.routes.draw do
  resources :memberships
  resources :groups
  mount Upmin::Engine => '/admin'
  root to: 'visitors#index'
  devise_for :users
  resources :users
  resources :posts do
  	resources :comments, :only => [:create, :destroy]
  end
  resources :attachments
end
