Rails.application.routes.draw do
  
  devise_for :users
  # default_url_options :host => "bloccitoff-cwilson04.c9users.io/"
  
  resources :users do
    resources :items, only: [:create, :destroy] do
      put :toggle
    end
  end
  
  get 'welcome/index'

  get 'welcome/about'
  
  root 'users#show'
  
end
