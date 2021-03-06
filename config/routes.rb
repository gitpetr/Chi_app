ChirchApp::Application.routes.draw do

  # Put all you routes to here (to keep correct localization).
  scope ":locale", locale: /#{I18n.available_locales.join("|")}/ do
    devise_for :users, controllers: {registrations: "registrations"}

    resources :articles
    resources :sermons
    resources :contacts,         only: [ :index, :edit, :update ]
    resources :welcome_messages, only: [ :edit, :update ]
    resources :homes,            only: [ :index ]

    resources :albums, except: [ :show ] do
      resources :photos
    end

    get '/users_list', to: 'stats#users_in_system'
    get '/login', to: redirect("/#{I18n.default_locale}/users/sign_in")

    root to: 'homes#index'
  end

  get '*path', to: redirect("/#{I18n.default_locale}/%{path}"), constraints: lambda { |req| !req.path.starts_with? "/#{I18n.default_locale}" and
                                                                                            !req.path.starts_with? "/rails/" } # Don't apply this rule for sextant's path to make it work.
  get '', to: redirect("/#{I18n.default_locale}")                                                 # Redirect as a default to home page.
end
