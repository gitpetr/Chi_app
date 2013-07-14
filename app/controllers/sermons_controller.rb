class SermonsController < ApplicationController
	load_and_authorize_resource

	def index
		gon.record_path = @sermons.last.record_player_path
	end

	def show
		gon.record_path = @sermon.record_player_path
	end

	def new
	end

	def create
		if @sermon.save
      redirect_to sermons_path
      flash[:success] = t( :sermon_created_message )
    else
      render 'new'
    end
	end
end
