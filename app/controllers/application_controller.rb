class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter :set_locale

  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_url, :alert => exception.message
  end

  private
    def set_locale
      I18n.locale = params[:locale] if params[:locale].present?

      # Redirect login.domain.com to domain/sing-in-path.
      if request.subdomain == 'login'
        redirect_to new_user_session_url(:subdomain => false)
      end
    end

    # To prevent problems with loading correct localization.
    def default_url_options(options = {})
      {locale: I18n.locale}
    end

    # Overwriting the sign_out redirect path method.
    def after_sign_out_path_for(resource_or_scope)
      request.referrer
    end

    # Overwriting the sign_in redirect path method.
    def after_sign_in_path_for(resource)
      root_path
    end
end
