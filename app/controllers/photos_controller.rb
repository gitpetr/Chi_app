class PhotosController < ApplicationController
  load_and_authorize_resource

  before_filter :load_album

  def index
    @photos = @album.photos
  end

  def new
    @photo = @album.photos.new
    puts @photo.inspect
  end

  def create
    if !params[:photo].nil?                                                                         # If user chose photos to upload.
      photos_db_before = Photo.all.size
      photos = params[:photo][:image]                                                               # Get array of input photos to save them later.

      if photos.size == 1                                                                           # If it is just one photo then we should save it via another method.
        @album.photos.create( :image => photos.first )                                              # I founded that only this works.
      else
        photos.each do |photo|
          @album.photos.create( :image => photo )                                                           # Key :image is very important, saving doesn't work without it.
        end
      end

      photos_db_after = Photo.all.size
      flash[:success] = t( :photo_created_message ) + " #{photos_db_after - photos_db_before}"      # Show message with number of created photos.
      redirect_to album_photos_path( @album )
    else                                                                                            # If user didn't choose any photo and clicked "upload".
      flash.now[:info] = t( :photo_choose_one_before_upload )
      render 'new' and return
    end
  end

  def edit
    @photo = @album.photos.find( params[:id] )
  end

  def update
    @photo = @album.photos.find( params[:id] )

    if @photo.update_attributes( params[:photo] )
      redirect_to album_photos_path( @album )
      flash[:success] = t( :photo_updated_message )
    else
      render 'edit'
    end
  end

  def destroy
    @photo = @album.photos.find( params[:id] )

    if @photo.destroy
      flash[:success] = t( :photo_destroyed_message )
    end

    redirect_to album_photos_path( @album )
  end

  private
    def load_album
      @album = Album.where("id = ?", params[:album_id]).first
    end
end
