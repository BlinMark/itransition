Rails.application.routes.draw do
  get 'users/show'
  devise_for :users, only: :omniauth_callbacks, controllers: {omniauth_callbacks: 'users/omniauth_callbacks'}
  scope "(:locale)", locale: /#{I18n.available_locales.join("|")}/ do

    devise_for :users, :controllers => {registrations: 'registrations', omniauth_callbacks: 'users/omniauth_callbacks' }, skip: :omniauth_callbacks


    root 'posts#index'
    resources :comments do
      member do
        put "like", to: "comments#upvote"
        put "dislike", to: "comments#downvote"
      end
    end
    resources :posts
    resources :users
    resources :tags, only: [:show]
    resources :categories


    mount Ckeditor::Engine => '/ckeditor'

    mount ActionCable.server => '/cable'

    match '/users',   to: 'users#index',   via: 'get'
  end
end
