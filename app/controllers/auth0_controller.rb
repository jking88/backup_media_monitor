class Auth0Controller < ApplicationController

  def callback
     # example request.env['omniauth.auth'] in https://github.com/auth0/omniauth-auth0#auth-hash
    # id_token = session[:userinfo]['credentials']['id_token']
    # store the user profile in session and redirect to root
    session[:userinfo] = request.env['omniauth.auth']

    redirect_to 'static_pages/manage'
  end
  def show
  end

  # def new
  #   @user_url = User_Url.new
  # end

  def failure
    @error_msg = request.params['message']
  end
end