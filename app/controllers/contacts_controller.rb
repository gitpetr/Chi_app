class ContactsController < ApplicationController
  load_and_authorize_resource

  def index
    @contact = Contact.first.nil? ? nil : Contact.first
  end

  def edit
  end

  def update
    if @contact.update_attributes( params[:contact] )
      redirect_to contacts_path
      flash[:success] = "Contacts updated!"
    else
      render 'edit'
    end
  end
end
