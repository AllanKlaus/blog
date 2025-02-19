# frozen_string_literal: true

Rails.application.routes.draw do
  root 'welcome#index'

  get 'static_pages/home'
  get 'static_pages/help'
  get 'static_pages/about'
  get 'static_pages/contact'

  devise_for :users

  resources :posts do
    resources :comments, only: %i[create destroy]
  end

  mount API::Base, at: '/'
  mount GrapeSwaggerRails::Engine, at: 'swagger'
end
