Rails.application.routes.draw do

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  devise_for :users

  root 'home#index'
  
  #scope path: ":user_id", as: "user" do
  resources :users do
    resources :dashboard, only: [:index]
    resources :virtual_machines
  end

end
