Rails.application.routes.draw do
  
  devise_for :users
  default_url_options :host => "bloccitoff-cwilson04.c9users.io/"
  
  resources :users, only: :show
  
  get 'welcome/index'

  get 'welcome/about'
  
  root 'welcome#index'
  
end
