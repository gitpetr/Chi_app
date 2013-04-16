class AlbumsController < ApplicationController
  load_and_authorize_resource

  def index
  end

  def new
  end

  def create
    if @album.save
      redirect_to albums_path
      flash[:success] = t( :album_created_message )
    else
      render 'new'
    end
  end
end
