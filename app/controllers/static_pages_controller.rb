class StaticPagesController < ApplicationController
    require 'flickr'
    def home
        @flickr = Flickr.new(ENV['flickr_api_key'],ENV['flickr_secret_key'])
        if params[:search].present?
           @user_id = search_params[:user_id] 
            @images = @flickr.photos
            @profile = @flickr.profile.getProfile(:user_id => @user_id)
            @photos = @flickr.people.getPhotos(:user_id => @user_id)
        end
    rescue Flickr::FailedResponse
        flash.now[:alert] = "Can't find user id"
    end  
    
    private
        def search_params
            
            params.require(:search).permit(:user_id) 
        
        end    
end
