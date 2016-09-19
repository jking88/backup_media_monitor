class StaticPagesController < ApplicationController
  def home
    @user = session[:userinfo]
  end


  def login
  end

end
