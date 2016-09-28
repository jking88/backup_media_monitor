Rails.application.routes.draw do

  get 'sessions/new'

  resources :keywords
  resources :urls
  resources :users


  root 'sessions#new'

  get 'auth0/failure'
  get 'static_pages/home' => 'static_pages#home'
  get 'home'              => 'static_pages#home'

  get 'graphs'            => 'static_pages#graphs'
  # get 'login'           => 'static_pages#login_page'
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


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get "/static_pages/login/" => "static_pages#login"

  get "/auth/auth0/callback" => "auth0#callback"
  get "/auth/failure" => "auth0#failure"



end
