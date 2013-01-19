class PhotosController < ApplicationController
  load_and_authorize_resource

  def index
    @first_photo = Photo.first.nil? ? nil : Photo.first.id
  end

  def new
  end

  def create
    if !params[:photo].nil?                                                                         # If user chose photos to upload.
      photos = params[:photo][:image]                                                               # Get array of input photos to save them later.

      if photos.size == 1                                                                           # If it is just one photo then we should save it via another method.
        Photo.create( :image => photos.first )                                                      # I founded that only this works.
      else
        photos.each do |photo|
          Photo.create( :image => photo )                                                           # Key :image is very important, saving doesn't work without it.
        end
      end

      redirect_to photos_path
    else                                                                                            # If user didn't choose any photo and clicked "upload".
      flash.now[:info] = t( :photo_choose_one_before_upload )
      render 'new' and return
    end

    # if @photo.save
    #   redirect_to photos_path
    #   flash[:success] = t( :photo_created_message )
    # else
    #   render 'new'
    # end
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
