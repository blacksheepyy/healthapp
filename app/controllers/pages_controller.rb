class PagesController < ApplicationController
    
    def home
        redirect_to users_path if logged_in?
    end
end