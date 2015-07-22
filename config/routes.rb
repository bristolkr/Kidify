Rails.application.routes.draw do
  mount Upmin::Engine => '/admin'
  devise_for :users
  resource :user, :only => :show do
    member { get :switch }
  end
  resources :groups do
    resources :memberships, :only => [:create, :destroy]
    resources :attachments
    resources :posts do
    	resources :comments, :only => [:create, :destroy]
    end
  end
  root to: 'visitors#index'
end
