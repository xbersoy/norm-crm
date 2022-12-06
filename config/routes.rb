Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'registrations'
  }
  resource :two_factor_settings, except: %i[index show]

  root to: 'home#index'
end
