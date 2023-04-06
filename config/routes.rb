# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'registrations',
    sessions:      'sessions',
    passwords:     'passwords'
  }
  resource :two_factor_settings, except: %i[index show]

  root to: 'home#index'
  get 'dashboard', to: 'dashboard#index'
  # resource :products
  get '/products', to: 'products#index'
end
