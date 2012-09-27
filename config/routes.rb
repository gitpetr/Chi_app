ChirchApp::Application.routes.draw do
  # Put all you routes to here (to keep correct localization).
  scope ":locale", locale: /#{I18n.available_locales.join("|")}/ do
    devise_for :users, :skip => [:registrations]                                          # Users can't register now (and destroy himself).
    as :user do
      get 'users/edit' => 'devise/registrations#edit', :as => 'edit_user_registration'    # But user can edit...
      put 'users' => 'devise/registrations#update', :as => 'user_registration'            # ..and update his password.

      get '/users/sign_out' => 'devise/sessions#destroy'                                  # Unfortunately i use that because Webrate generated GET method for logout, not DELETE.
    end

    resources :articles
    resources :photos, :only => [:index, :new, :create, :edit, :update]

    match '/users_list', :to => 'stats#users_in_system'

    root :to => 'articles#index'
  end

  match '*path', to: redirect("/#{I18n.default_locale}/%{path}"), constraints: lambda { |req| !req.path.starts_with? "/#{I18n.default_locale}/" }
  match '', to: redirect("/#{I18n.default_locale}")
  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  # root :to => 'welcome#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
