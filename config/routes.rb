Rails.application.routes.draw do
  get 'users/show'
  scope "(:locale)", locale: /#{I18n.available_locales.join("|")}/ do

    devise_for :users, :controllers => { registrations: 'registrations' }
    root 'posts#index'
    resources :posts
    resources :users
    resources :tags, only: [:show]
    resources :categories
    resources :comments

    mount Ckeditor::Engine => '/ckeditor'

    mount ActionCable.server => '/cable'
  end
end
