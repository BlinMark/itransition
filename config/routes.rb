Rails.application.routes.draw do
  devise_for :users
  root 'posts#index'
  resources :posts
  resources :tags, only: [:show]
  resources :categories
  resources :comments
  mount Ckeditor::Engine => '/ckeditor'

end
