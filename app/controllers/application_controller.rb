class ApplicationController < ActionController::Base
    protect_from_forgery with: :exception 
  
    private   
    def current_user   
        User.where(id: session[:user_id]).first   
    end

    def get_tags
        Tag.all
    end

    def get_users
        User.all
    end

    helper_method :current_user
    helper_method :get_tags
    helper_method :get_users
end
