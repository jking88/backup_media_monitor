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

    @title_arr = Array.new




    @all_urls = Url.all



    @url_arr = Array.new
    @all_urls.each do |u|


      @page = Nokogiri::HTML(open(u.url))
      @url_arr.push(u.url)
      @title_arr.push(@page.css('title').text)

    end

  end



  def login
  end

  def graphs
  end

  def manage
   @title_arr = Array.new




    @all_urls = Url.all

    @url_arr = Array.new
    @all_urls.each do |u|


      @page = Nokogiri::HTML(open(u.url))
      @url_arr.push(u)
      @title_arr.push(@page.css('title').text)

    end


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
