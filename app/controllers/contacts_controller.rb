class ContactsController < ApplicationController
  def index
    @contact = Contact.first.nil? ? nil : Contact.first
  end

  def edit
  end

  def update
  end
end
