require 'rubygems'
require 'nokogiri'
require 'open-uri'
class StaticPagesController < ApplicationController
  #skip_before_action :verify_authenticity_token
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
    @user = User.find_by id: session[:user_id]


    @all_urls = Url.all
    @css_selectors_arr = Keyword.all

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

  def article_display

  @checked_boxes = params[:list_name_ids]

  @user = User.find_by id: session[:user_id]

  @title_arr = Array.new
  @body_arr = Array.new
  @href_arr = Array.new
  @all_urls = Url.all
  @css_selectors_arr = Keyword.all
  @lists = List.all

  @test_url = Url.first

  @all_comments = Comment.order(:created_at)



  @all_urls.each do |u|

    @page = Nokogiri::HTML(open(u.url))
    @title_arr.push(@page.css('title').text)
    @body_arr.push(@page.css('body').text)
    Nokogiri::HTML(open(u.url)).xpath("//img/@src").each do |src|
      uri = URI.join( u.url, src ).to_s
      File.open(File.basename(uri),'wb') { |f| f.write(open(uri).read) }
    end
    end
  end

  def article_display_email_list
    if @checked_arr = params["checked_arr"]
      redirect_to email_display_path(:id => @checked_arr)
    end
  end

  def email_display
    @checked_arr = params["checked_arr"]
    @checked_arr_permanent = @checked_arr


  end







end
