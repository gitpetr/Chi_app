This is Web app for chirch.

**Changelog**

------------------------------------------------------------------------------------------

* I created my own .rvmrc to use project-specific ruby (1.9.3-head now) and gemset (global). I did that:
    `$ rvm --rvmrc --create ruby-1.9.3-head@global`

    Don't forget to run that in current project:
    `$ rvm rvmrc trust DIR`

    And then reload shell.
* User can't delete himself now. To enable this feature:
  1. Remove from routes.rb from `devise_for :users, :skip => [:registrations]` that `:skip => [:registrations]`
     OR add link (i enabled few featerus in routes).
  2. Add to app/views/devise/registrations/edit (or in other file):
     `%legend
        %h3=t(".cansel_acc_header")
      %p
        =t(".cansel_acc_text")
        #{link_to "Cansel your accaunt", registration_path(resource_name), :confirm => "Are you sure?", :method => :delete}`
* Added line to load script if it IE 8 or less.
* Now users can't register in system. To enable this feature:
  1. Remove from routes.rb from `devise_for :users, :skip => [:registrations]` that `:skip => [:registrations]`
     OR add link (i enabled few featerus in routes).
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
