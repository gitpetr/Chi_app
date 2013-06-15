class WelcomeMessagesController < ApplicationController
  load_and_authorize_resource

  def edit
  end

  def update
    if @welcome_message.update_attributes( params[:welcome_message] )
      redirect_to root_path
      flash[:success] = "Saved!"
    else
      render 'edit'
    end
  end
end
