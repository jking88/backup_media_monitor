Rails.application.routes.draw do
  get 'auth0/callback'

  get 'auth0/failure'
  get 'static_pages/home' => 'static_pages#home'
  root'auth0#home'

  get 'graphs' => 'static_pages#graphs'
  get 'login' => 'static_pages#login'
  get 'manage' => 'static_pages#manage'
  get 'home' => 'auth0#home'
  get 'payment' => 'static_pages#payment'
  get 'profile' => 'static_pages#profile'
  get 'search' => 'static_pages#search'
  get 'settings' => 'static_pages#settings'


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get "/static_pages/login/" => "static_pages#login"

  get "/auth/auth0/callback" => "auth0#callback"
  get "/auth/failure" => "auth0#failure"



end
