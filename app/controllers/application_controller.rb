class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper
  def home

  end

  def replace_invalid_characters(str)
      for i in (0...str.size)
        if !str[i].valid_encoding?
          str[i]="?"
        end
      end
    end



end
