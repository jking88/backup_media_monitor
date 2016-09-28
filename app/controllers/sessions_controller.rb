class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
        #log user in and redirect to show page
    else
        #create error message
        flash[:danger] = 'Invalid email/password combination!'
        render 'new'
    end
  end

  def destroy
  end

end