class PhotosController < ApplicationController
  load_and_authorize_resource

  def index
  end

  def new
  end

  def create
    if @photo.save
      redirect_to photos_path
      flash[:success] = t( :photo_created_message )
    else
      render 'new'
    end
  end
end
