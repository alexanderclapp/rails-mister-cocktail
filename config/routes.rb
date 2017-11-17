Rails.application.routes.draw do
  resources :cocktails, only: [ :index, :show, :new, :create, :destroy ] do
    resources :doses, only: [:new, :create]
  end

  resources :doses, only: [:destroy]

  mount Attachinary::Engine => "/attachinary"

  root to: 'cocktails#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
