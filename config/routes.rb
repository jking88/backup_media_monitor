Rails.application.routes.draw do
  get 'auth0/callback'

  get 'auth0/failure'

  get 'static_pages/home'
  get 'auth0/loggedinas'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'static_pages#login'

  get "/auth/auth0/callback" => "auth0#callback"
  get "/auth/failure" => "auth0#failure"



end
