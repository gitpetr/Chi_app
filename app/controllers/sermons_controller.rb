class SermonsController < ApplicationController
	load_and_authorize_resource

	def index
		@sermons = Sermon.order("created_at DESC")

		if !@sermons.empty?
      redirect_to sermon_path( @sermons.first )
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

	def destroy
		if @sermon.destroy
			flash[:success] = t( :sermon_deleted_message )
		end

		redirect_to sermons_path
	end
end
