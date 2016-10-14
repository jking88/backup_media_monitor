Rails.application.routes.draw do


  resources :lists
  resources :comments
  resources :email_subscribers
  resources :keywords
  resources :urls
  resources :users


  root 'sessions#new'

  get 'home'                       => 'static_pages#home'
  get 'graphs'                     => 'static_pages#graphs'
  get 'manage'                     => 'static_pages#manage'
  get 'home'                       => 'static_pages#home'
  get 'payment'                    => 'static_pages#payment'
  get 'profile'                    => 'static_pages#profile'
  get 'search'                     => 'static_pages#search'
  get 'settings'                   => 'static_pages#settings'
  get 'article_display'            => 'static_pages#article_display'
  post 'article_display'           => 'static_pages#article_display'
  get 'email_display'              => 'static_pages#email_display'
  post 'email_display'             => 'static_pages#article_display_email_list'
  get 'article_display_email_list' => 'static_pages#article_display_email_list'
  post 'sent_mail_review'          => 'static_pages#sent_mail_review'
  get 'sent_mail_review'           => 'static_pages#sent_mail_review'
  get 'list_view'                  => 'static_pages#list_view'
  post 'list_view'                 => 'static_pages#list_view_helper'
  get 'filtered_view'              => 'static_pages#filtered_view'
  post 'filtered_view'             => 'static_pages#filtered_view'

  post 'urls/new'                  => 'urls#new'

  get 'new'                        => 'user_url#new'
  post 'show'                      => 'user_url#new'

  get  '/login'                    => 'sessions#new'
  post '/login'                    => 'sessions#create'
  delete '/logout'                 => 'sessions#destroy'






end
