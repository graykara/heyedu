# frozen_string_literal: true

Rails.application.routes.draw do
  draw :madmin
  devise_for :users

  get 'pages/welcome'
  get 'pages/privacy'
  get 'pages/terms'
  get 'pages/about'
  get 'pages/sitemap'
  get 'pages/remote'
  get 'pages/prevent_email'

  Post.categories.each_key do |category|
    scope category, as: category do
      resources :posts
    end
  end

  root to: 'pages#welcome', id: 'home'

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
