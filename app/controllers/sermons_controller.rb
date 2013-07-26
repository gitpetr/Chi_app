class SermonsController < ApplicationController
	load_and_authorize_resource

	def index
		@sermons = Sermon.order("created_at DESC")

		if !@sermons.empty?
			@fresh_sermon   = @sermons.first
			gon.record_path = @fresh_sermon.record_player_path
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

	def edit
	end

	def update
		if @sermon.update_attributes( params[:sermon] )
      redirect_to sermons_path
      flash[:success] = t( :sermon_updated_message )
    else
      render 'edit'
    end
	end
end
