require 'rubygems'
require 'typhoeus'
require 'nokogiri'
require 'open-uri'
require 'net/http'
require 'mechanize'
class StaticPagesController < ApplicationController

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
  @all_comments = Comment.order(:created_at)


  @title_arr = Array.new
  @body_arr = Array.new
  @href_arr = Array.new

  @user = User.find_by id: session[:user_id]

  @all_urls = Url.all
  @test_url = Url.first
  @css_selectors_arr = Keyword.all
  @lists = List.all

  if @article_arr = params["article_arr"]
    redirect_to article_display_path(:checked_arr => @article_arr)
  end
  # @article_arr = params["checked_arr"]

  # @article_arr.each do |u|
  #   @doc = Typhoeus.get(u)
  #   @page = Nokogiri::HTML(@doc.body)
  #   @title_arr.push(@page.css('title').text)
  #   @body_arr.push(@page.css('#body').text)
  #   @page.xpath("//img/@src").each do |src|
  #     uri = URI.join( u, src ).to_s
  #     File.open(File.basename(uri),'wb') { |f| f.write(open(uri).read) }
  #   end
  #   end
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

    if @parent = params["checked_arr"] #all of the checkmarked parent websites
    @titles = Array.new
    @filted_articles = Array.new
    @articles_return = Array.new #array for all of the filtered urls to be added to
    @all_child_data = Array.new #array  that contains a hash of data for each child
        if @keyword = params["keyword"]
          @r1 = Regexp.new(@keyword.downcase) #create regular exp
        end
        @parent.each do |e|
          @response = Typhoeus.get(e, ssl_verifyhost: 0)
          @body = Nokogiri::HTML(@response.body)
          @select_text = @body.xpath("//a/@href")   #Grabs all href's within a tags within url
          @select_text.each do |href|
             if (/http/ =~ href) != nil    # If it contains http
                  if (/.jpg/ =~ href) == nil && (/.png/ =~ href) == nil  # If it doesn't contain .jpg or .png
                    @response = Typhoeus.get(href, ssl_verifyhost: 0)  # makes a request to the href http tag within url
                    @child_body = Nokogiri::HTML(@response.body)  # gets the body of the url
                    @all_p_tags = @child_body.xpath("//body/p").to_s
                    if (@r1 =~ @all_p_tags) != nil
                        #create hash for child
                        @title = @child_body.xpath("//title").to_s
                        @child_url = href
                        @date_response = Faraday.head(href)
                        @temp = @date_response['Last-Modified']
                        if @temp.present?
                          @child_date = @temp
                        end
                        @hash = {:title => @title, :body => @all_p_tags, :url => @child_url, :date => @child_date.to_s}
                        @all_child_data.push(@hash)
                    end
                  end
             end
          end
        end
        flash[:notice] = "Hi"
        redirect_to list_view_path(:child => @all_child_data)
    end




    #  @articles_uniq = @articles_return.uniq
    #  @articles_uniq.each do |article|
    #      @response_articles = Typhoeus.get(article, ssl_verifyhost: 0)
    #      @body_article = Nokogiri::HTML(@response_articles.body)
    #      if (@titles.include? @body_article.xpath("//title").inner_text) == false
    #          @flag = true
    #          @titles.push(@body_article.xpath("//title").inner_text)
    #      else
    #          @flag = false
    #      end
    #      if @flag
    #          @response = Faraday.head(article)
    #          @date = @response['Last-Modified']
    #          if @date.present?
    #             @filted_articles.push(article)
    #          end
    #      end
    #   end
    #   redirect_to list_view_path(:filted_articles => @filted_articles)
    # end




  end

  def filtered_view
    if @checked_urls = params["checked_arr"]
      if @keyword = params["keyword"]
        redirect_to filtered_view_path(:checked_urls => @checked_urls, :keyword => @keyword)
      end
    end

  end

end



