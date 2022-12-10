Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'registrations',
    sessions: 'sessions'
  }
  resource :two_factor_settings, except: %i[index show]

  root to: 'home#index'
  get 'dashboard', to: 'dashboard#index'
end
