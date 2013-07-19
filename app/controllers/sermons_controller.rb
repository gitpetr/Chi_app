class SermonsController < ApplicationController
	load_and_authorize_resource

	def index
		@sermons = Sermon.order("created_at DESC")

		if !@sermons.empty?
			gon.record_path = @sermons.last.record_player_path
		else
			gon.record_path = nil
		end
	end

	def show
		@sermons = Sermon.order("created_at DESC")
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
