Rails.application.routes.draw do
  namespace :dashboard do
    get 'dashboard/index'
  end

  devise_for :users
  get 'home/index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "home#index"

  namespace :dashboard do
      root to: "dashboard#index"
  end
end
