Rails.application.routes.draw do
  root 'posts#index'
  resources :posts
  mount Ckeditor::Engine => '/ckeditor'

end
