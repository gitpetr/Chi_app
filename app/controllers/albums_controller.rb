class AlbumsController < ApplicationController
  load_and_authorize_resource

  def index
    @albums = Album.order("updated_at DESC")
  end

  def new
  end

  def create
    album = current_user.albums.create( params[:album] )

    if album.save
      redirect_to albums_path
      flash[:success] = t( :album_created_message )
    else
      render 'new'
    end
  end
end
