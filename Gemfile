source 'https://rubygems.org'

gem 'rails', '3.2.13'
gem 'pg', '0.15.1'                                                                                  # Connect to postgreSQL.
gem 'jquery-rails', '2.2.1'                                                                         # Jquery for rails.
gem 'haml', '4.0.2'                                                                                 # Templating engine for HTML.
gem 'therubyracer', :platform => :ruby
gem 'devise', '2.2.3'                                                                               # Easy authentication.
gem 'simple_form', '2.1.0'                                                                          # Super simple forms with bootstrap look support.
gem 'bootstrap-wysihtml5-rails', "0.3.1.19"                                                         # Rich text editor via JS.
gem 'kaminari', '0.14.0'                                                                            # Be very carefull with changing version of this gem (i modified a lot generated views).
gem 'cancan', '1.6.9'                                                                               # Authorization library.
gem 'carrierwave', '0.8.0'                                                                          # Simple file uploading.
gem 'rmagick', '2.13.2'                                                                             # Powerfull image manipulation. Don't forget to install imagemagick before that!
gem 'gmaps4rails', '1.5.6'                                                                          # Google maps integration.
gem 'unicorn', '4.6.2'                                                                              # Use unicorn as the app server
gem 'capistrano', '2.14.2'                                                                          # Deploy with Capistrano
gem 'less-rails', '2.3.2'                                                                           # twitter-bootstrap-rails needs that now. Without that it fails.
gem 'slim', '1.3.8'
gem 'gon', '3.0.5'                                                                                  # Access data from ruby and JS.
gem 'sitemap_generator', '4.1.0'                                                                    # Generating sitemap.

gem 'haml2slim'

# Gems used only for assets and not required
# in production environments by default.
# See https://github.com/sstephenson/execjs#readme for more supported runtimes
# gem 'therubyracer', :platforms => :ruby
group :assets do
  gem 'sass-rails',   '~> 3.2.4'
  gem 'coffee-rails', '~> 3.2.2'
  gem 'twitter-bootstrap-rails', '2.2.6'                                                            # Twitter Bootstrap 2.
  gem 'uglifier', '>= 1.2.3'
end

group :development do
  gem 'sextant'                                                                                     # Navigate in routes on site.
  gem 'rails_best_practices'
  gem 'webrick', '1.3.1'                                                                            # Standart server. I specify it to remove warning from logs.
  gem 'annotate', '~> 2.5.0'
  gem 'better_errors', '0.8.0'                                                                      # Show errors with better output.
  gem 'binding_of_caller', '0.7.1'                                                                  # Advance better errors.
  gem 'brakeman', '2.0.0'                                                                           # Checking for secure vulnerabilities.
  gem 'meta_request', '0.2.5'                                                                       # Panel in chrome to debug rails apps.
  gem 'quiet_assets', '1.0.2'                                                                       # Don't show assets messages.
end

group :development, :test do
  gem 'rspec-rails', '2.13.0'
  gem 'rb-fsevent'                                                                                  # Dependency for guard.
  gem 'guard-rspec', '2.5.2'                                                                        # Rspec for guard.
  gem 'terminal-notifier-guard'                                                                     # Notification via notification center.
  gem 'launchy'                                                                                     # This gem allow us to open testing page in browser (save_and_open_page method)
end

group :test do
  gem 'capybara', '2.1.0'                                                                           # Browser automation for rspec with js support.
  gem 'factory_girl_rails', '4.2.1'                                                                 # Factories for tests.
  gem 'database_cleaner', '0.9.1'
  gem 'selenium-webdriver', '2.32.1'                                                                # Driver to launch tests in Chrome.
end

# To use ActiveModel has_secure_password
# gem 'bcrypt-ruby', '~> 3.0.0'

# To use Jbuilder templates for JSON
# gem 'jbuilder'

# To use debugger
# gem 'debugger'
