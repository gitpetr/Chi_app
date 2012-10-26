class ContactsController < ApplicationController
  load_and_authorize_resource

  def index
    @contact = Contact.first.nil? ? nil : Contact.first
    @json = Contact.first.to_gmaps4rails                # Getting data to show google map properly.
  end

  def edit
  end

  def update
    if @contact.update_attributes( params[:contact] )
      redirect_to contacts_path
      flash[:success] = t( :contact_updated_message )
    else
      render 'edit'
    end
  end
end
