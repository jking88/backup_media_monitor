require 'rubygems'
require 'nokogiri'
require 'open-uri'
class StaticPagesController < ApplicationController
  # before_action :logged_in_using_omniauth?

  # private

  # def logged_in_using_omniauth?
  #   unless session[:userinfo].present?
  #     # Redirect to page that has the login here
  #     redirect_to '/manage'
  #   end
  # end

  def login_page
  end


  def home
    @first_url = Url.last.url
    puts(@first_url)
    @page = Nokogiri::HTML(open(@first_url))
    @data = @page.css("body")



  end



  def login
  end

  def graphs
  end

  def manage
  end

  def payment
  end

  def profile
  end

  def search
  end

  def settings
  end





end
