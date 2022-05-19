# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users

  get 'pages/welcome'
  get 'pages/privacy'
  get 'pages/terms'
  get 'pages/about'
  get 'pages/sitemap'
  get 'pages/remote'
  get 'pages/prevent_email'

  root to: 'pages#welcome', id: 'home'

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
