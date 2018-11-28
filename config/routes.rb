Rails.application.routes.draw do
  devise_for :users
  root 'home#index' 

  resources :posts do
    resources :comments
  end 
  

  

  #Home rute
  # get 'home/index',      to: 'home#index'
  # get 'home/about',      to: 'home#about'
  # get 'home/contact_us', to: 'home#contact_us'
  # get 'home/prices',     to: 'home#prices'

  # #blog routes
  # get 'blog/index'
  # get 'blog/new'
  # get 'blog/show'
  # get 'blog/edit'

  # #admin routs
  # get 'admin/index'
  # get 'admin/show'
  
  
  
  #formas para definir las rutas
  #get 'home', to: 'home#index'
  # #get 'home/index'
  # get '/home/index', to: 'home#index', as: 'cualquier_cosa'
  # get '/home/:name', to: 'home#hello'
end
