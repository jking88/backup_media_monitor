Rails.application.routes.draw do


  resources :keywords
  resources :urls
  resources :users


  root 'sessions#new'

  get 'static_pages/home' => 'static_pages#home'
  get 'home'              => 'static_pages#home'
  get 'graphs'            => 'static_pages#graphs'
  get 'manage'            => 'static_pages#manage'
  get 'home'              => 'static_pages#home'
  get 'payment'           => 'static_pages#payment'
  get 'profile'           => 'static_pages#profile'
  get 'search'            => 'static_pages#search'
  get 'settings'          => 'static_pages#settings'

  get 'new'               => 'user_url#new'
  post 'show'             => 'user_url#new'

  get  '/login'           => 'sessions#new'
  post '/login'           => 'sessions#create'
  delete '/logout'        => 'sessions#destroy'






end
