Rails.application.routes.draw do
  root to: 'pages#home'
  
  resources :portfolios, except: [:show]
  get 'portfolio/:id', to: 'portfolios#show', as: 'portfolio_show'
  
  get 'about', to: 'pages#about'
  get 'contact', to: 'pages#contact'
  
  resources :blogs
  
end
