class SessionsController < ApplicationController
  def new
    @user_email = session[:email]
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
        #log user in and redirect to show page
        login user
        # params[:session][:remember_me] == '1' ? remember(user) : forget(user)

        remember user
        redirect_to '/article_display'
    else
        #create error message
        flash[:danger] = 'Invalid email/password combination!'
        render 'new'
    end
  end

  def destroy
    logout if logged_in?
    redirect_to root_url
  end

end
