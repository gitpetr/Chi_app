class AlbumsController < ApplicationController
  load_and_authorize_resource

  def index
    @albums = Album.order("updated_at DESC")
    gon.small_preview_size = @small_preview_size = 65
  end

  def new
  end

  def create
    @album = current_user.albums.new( params[:album] )

    if @album.save
      redirect_to album_photos_path( @album )
      flash[:success] = t( :album_created_message )
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    if @album.update_attributes( params[:album] )
      redirect_to albums_path
      flash[:success] = t( :album_updated_message )
    else
      render 'edit'
    end
  end

  def destroy
    if @album.destroy
      flash[:success] = t( :album_deleted_message )
    end

    redirect_to albums_path
  end
end
