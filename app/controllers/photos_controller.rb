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

  def edit
  end

  def update
    if @photo.update_attributes( params[:photo] )
      redirect_to photos_path
      flash[:success] = t( :photo_updated_message )
    else
      render 'edit'
    end
  end

  def destroy
    @photo.destroy
    flash[:success] = t( :photo_destroyed_message )
    redirect_to photos_path
  end
end
