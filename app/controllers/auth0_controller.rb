class Auth0Controller < ApplicationController
  def callback
     # example request.env['omniauth.auth'] in https://github.com/auth0/omniauth-auth0#auth-hash
    # id_token = session[:userinfo]['credentials']['id_token']
    # store the user profile in session and redirect to root
    session[:userinfo] = request.env['omniauth.auth']
    @id_token = session[:userinfo]['credentials']['id_token']

    redirect_to 'auth0/show'
  end
  def show
  end

  def failure
    @error_msg = request.params['message']
  end
end