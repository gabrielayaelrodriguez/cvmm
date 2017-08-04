Rails.application.routes.draw do

  #resources :global_resources
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  devise_for :users, :controllers => { registrations: 'registrations', omniauth_callbacks: 'omniauth_callbacks'  }
  #devise_for :users, path: "auth", :controllers => {  omniauth_callbacks: 'omniauth_callbacks'  }

  root 'home#index'
  
  #scope path: ":user_id", as: "user" do
  #resources :user do
  #  resources :dashboard, only: [:index]
  #  resources :virtual_machines do
  #    resources :disks
  #  end
  #end

  #resource :global_resource, only: [:show, :edit, :update]


  namespace 'user' do
    resources :dashboard, only: [:index]
    resources :virtual_machines do
      resources :disks, except: :index
    end
  end

  namespace 'admin' do
    resources :dashboard, only: [:index]
    resource :global_resource, only: [:show, :edit, :update]
    resources :virtual_machines, only: [:index, :show, :destroy] do
      resources :disks, only: :show
    end
  end

  match "*path", to: "home#catch_404", via: :all

end
