require 'rubygems'
require 'typhoeus'
require 'nokogiri'
require 'open-uri'
require 'net/http'
require 'mechanize'
require 'addressable/uri'
class StaticPagesController < ApplicationController
respond_to? :html

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

  def article_display_helper
    if @parent = params["checked_arr"]
      @response = url_for(action: 'article_display', controller: 'static_pages')

      @uri = Addressable::URI.parse(@response.to_s)

      @params = params.merge({:parent => @parent})
      @params.delete("checked_arr")
      @uri.query_values = params
      @uri.to_s

    end

  end

  def article_display

    @checked_boxes = params[:list_name_ids]
    @all_comments = Comment.order(:created_at)


    @title_arr = Array.new
    @body_arr = Array.new
    @href_arr = Array.new

    @user = User.find_by id: session[:user_id]

    @all_urls = Url.all
    @test_url = Url.first
    @css_selectors_arr = Keyword.all
    @lists = List.all

  end

  def article_display_email_list
    @email_subs_per_list = Array.new
    if @checked_arr = params["checked_arr"]
      @checked_arr.each do |list|
        EmailSubscriber.where(list_name: list).find_each do |subscriber|
          @email_subs_per_list.push(subscriber.email)
        end
      end
    end

      redirect_to email_display_path(:id => @email_subs_per_list)
  end

  def email_display
    @file = render_to_string :template => 'notifier_mailer/notify.html.erb'

  end



  def sent_mail_review
    if @send_to_arr = params["send_to_emails"]
      @send_to_arr.each do |sub|
        NotifierMailer.notify(sub).deliver
      end
      redirect_to sent_mail_review_path(:id => @send_to_arr)
    end

  end


  def list_view
    @urls = Url.all
  end


  def article_select_helper
    if @parent = params["checked_arr"]
      if @keyword = params["keyword"]
        redirect_to article_select_path(:parent => @parent, :keyword => @keyword)
      end
    end

    end

  def article_select
  end

  def filtered_view
    if @checked_urls = params["checked_arr"]
      if @keyword = params["keyword"]
        redirect_to filtered_view_path(:checked_urls => @checked_urls, :keyword => @keyword)
      end
    end
  end

end



