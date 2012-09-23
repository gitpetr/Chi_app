class PhotosController < ApplicationController
  def index

  end

  def new
    @photo = Photo.new
  end

  def create
    @photo = Photo.new( params[:photo] )

    if @photo.save
      redirect_to photos_path
      flash[:success] = t( :photo_created_message )
    else
      render 'new'
    end
  end
end
