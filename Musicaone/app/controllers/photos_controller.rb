    class PhotosController < ApplicationController
     def destroy
          @photo = Photo.find(params[:id])
           prof = @photo.prof
                @photo.destroy    
          @photos = Photo.where(prof_id: prof.id)
                respond_to :js
     end
    end