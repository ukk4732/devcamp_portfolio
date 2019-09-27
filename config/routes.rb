Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  
  resources :portfolios, except: [:show]
  get 'angular-items', to: 'portfolios#angular'
  get 'portfolio/:id', to: 'portfolios#show', as: 'portfolio_show'
  
  get 'about', to: 'pages#about'
  get 'contact', to: 'pages#contact'
  
  resources :blogs do 
    member do 
      post :toggle_status
    end
  end
  
end
