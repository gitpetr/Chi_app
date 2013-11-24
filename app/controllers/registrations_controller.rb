class RegistrationsController < Devise::RegistrationsController
  def new
    prevent_sign_up
  end

  def create
    prevent_sign_up
  end

  private

  def prevent_sign_up
    redirect_to root_path and return
  end
end