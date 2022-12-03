Rails.application.routes.draw do
  get 'documentation', to: 'documentation#index'

  resources :examples, only: :index
  namespace :examples, path_names: { new: '' } do
    resource :custom,           only: [:new, :create]
    resource :floating_label,   only: [:new, :create]
    resource :input_group,      only: [:new, :create]
    resource :vertical,         only: [:new, :create]
    resource :horizontal,       only: [:new, :create]
    resource :inline,           only: [:new, :create]
  end

  root to: 'home#index'
end
