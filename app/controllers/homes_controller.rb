class HomesController < ApplicationController
  layout "home", :only => [ :index ]

  def index
  	authorize! :index, :home

    @photos = Photo.order(:created_at).last(2).reverse
    @welcome_message = WelcomeMessage.first
  end
end
