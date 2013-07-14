ChirchApp::Application.routes.draw do

  # Put all you routes to here (to keep correct localization).
  scope ":locale", locale: /#{I18n.available_locales.join("|")}/ do
    devise_for :users, :skip => [:registrations]                                                    # Users can't register now (and destroy himself).
    as :user do
      get 'users/edit' => 'devise/registrations#edit', :as => 'edit_user_registration'              # But user can edit...
      put 'users' => 'devise/registrations#update', :as => 'user_registration'                      # ..and update his password.
      get '/users/sign_out' => 'devise/sessions#destroy'                                            # Unfortunately i use that because Webrate generated GET method for logout, not DELETE.
    end

    resources :articles
    resources :contacts,         :only => [ :index, :edit, :update ]
    resources :welcome_messages, :only => [ :edit, :update ]
    resources :homes,            :only => [ :index ]
    resources :sermons,          :only => [ :index, :new, :create ]

    resources :albums, :except => [ :show ] do
      resources :photos
    end

    match '/users_list', :to => 'stats#users_in_system'

    root :to => 'homes#index'
  end

  # match '*path', to: redirect("/#{I18n.default_locale}/%{path}"), constraints: lambda { |req| !req.path.starts_with? "/#{I18n.default_locale}" and
                                                                                               # req.path != "/rails/routes" } # Don't apply this rule for sextant's path to make it work.
  match '', to: redirect("/#{I18n.default_locale}")                                                 # Redirect as a default to home page.
end
