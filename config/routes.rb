Rails.application.routes.draw do
  devise_for :users
  resource :two_factor_settings, except: %i[index show]

  root to: 'home#index'
end
