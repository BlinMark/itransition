Rails.application.routes.draw do
  root 'posts#index'
  resources :posts
  resources :tags, only: [:show]
  mount Ckeditor::Engine => '/ckeditor'

end
