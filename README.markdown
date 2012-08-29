This is Web app for chirch.

**Changelog**

------------------------------------------------------------------------------------------

* Added line to load script if it IE 8 or less. 
* Now users can't register in system. To enable this feature:
  1. Remove from routes.rb from `devise_for :users, :skip => [:registrations]` that `:skip => [:registrations]`
  2. From app/views/devise/shared/_links uncomment this:
    ` -#  %br/
      -#- if devise_mapping.registerable? && controller_name != 'registrations'
      -#  = link_to t(".sign_up_link"), new_registration_path(resource_name)`
* Devise views converted from .erb to .haml via [This link](https://github.com/plataformatec/devise/wiki/How-To%3a-Create-Haml-and-Slim-Views)
* I18n (English and Russian).
* Links added to login/logout.
* Show flash messages (which can be closed) and debug information (for developer only).
* Navbar now can be collapesed.
* Bootstrap integrated in the app via 'twitter-bootstrap-rails' gem.
* Haml integrated in the app.
