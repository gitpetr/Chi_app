source 'https://rubygems.org'

gem 'rails', '3.2.16'
gem 'pg', '0.17.0'                                                                                  # Connect to postgreSQL.
gem 'jquery-rails', '3.0.4'                                                                         # Jquery for rails.
gem 'jquery-ui-rails', '4.1.0'                                                                      # Jquery css (for widgets and etc).
gem 'haml', '4.0.4'                                                                                 # Templating engine for HTML.
gem 'therubyracer', :platform => :ruby
gem 'devise', '3.2.1'                                                                               # Easy authentication.
gem 'simple_form', '2.1.1'                                                                          # Super simple forms with bootstrap look support.
gem 'bootstrap-wysihtml5-rails', '0.3.1.23'                                                         # Rich text editor via JS.
gem 'kaminari', '0.15.0'                                                                            # Be very carefull with changing version of this gem (i modified a lot generated views).
gem 'cancan', '1.6.10'                                                                              # Authorization library.
gem 'carrierwave', '0.9.0'                                                                          # Simple file uploading.
gem 'rmagick', '2.13.2'                                                                             # Powerfull image manipulation. Don't forget to install imagemagick before that!
gem 'gmaps4rails', '1.5.6'                                                                          # Google maps integration.
gem 'unicorn', '4.7.0'                                                                              # Use unicorn as the app server
gem 'capistrano', '2.14.2'                                                                          # Deploy with Capistrano
gem 'less-rails', '2.4.2'                                                                           # twitter-bootstrap-rails needs that now. Without that it fails.
gem 'slim', '2.0.2'
gem 'gon', '4.1.1'                                                                                  # Access data from ruby and JS.
gem 'sitemap_generator', '4.3.0'                                                                    # Generating sitemap.
gem 'rails-i18n', '~> 3.0.0'
gem 'tilt', '1.3.7'                                                                                 # To resolve bundler error with "tilt"

gem 'haml2slim'

# Gems used only for assets and not required
# in production environments by default.
# See https://github.com/sstephenson/execjs#readme for more supported runtimes
# gem 'therubyracer', :platforms => :ruby
group :assets do
  gem 'sass-rails',   '~> 3.2.4'
  gem 'coffee-rails', '~> 3.2.2'
  gem 'twitter-bootstrap-rails', '2.2.8'                                                            # Twitter Bootstrap 2.
  gem 'uglifier', '>= 1.2.3'
end

group :development do
  gem 'sextant', '0.2.4'                                                                            # Navigate in routes on site.
  gem 'rails_best_practices', '1.13.8'
  gem 'webrick', '1.3.1'                                                                            # Standart server. I specify it to remove warning from logs.
  gem 'annotate', '~> 2.5.0'
  gem 'better_errors', '0.8.0'                                                                      # Show errors with better output.
  gem 'binding_of_caller', '0.7.1'                                                                  # Advance better errors.
  gem 'brakeman', '2.2.0'                                                                           # Checking for secure vulnerabilities.
  gem 'meta_request', '0.2.5'                                                                       # Panel in chrome to debug rails apps.
  gem 'quiet_assets', '1.0.2'                                                                       # Don't show assets messages.
end

group :development, :test do
  gem 'rspec-rails', '2.14.0'
  gem 'rb-fsevent', '0.9.3'                                                                         # Dependency for guard.
  gem 'guard-rspec', '2.5.2'                                                                        # Rspec for guard.
  gem 'terminal-notifier-guard', '1.5.3'                                                            # Notification via notification center.
  gem 'launchy', '2.3.0'                                                                            # This gem allow us to open testing page in browser (save_and_open_page method)
end

group :test do
  gem 'shoulda-matchers', '2.4.0'
  gem 'capybara', '2.1.0'                                                                           # Browser automation for rspec with js support.
  gem 'capybara-webkit', '1.0.0'
  gem 'factory_girl_rails', '4.2.1'                                                                 # Factories for tests.
  gem 'database_cleaner', '1.2.0'
  gem 'selenium-webdriver', '2.37.0'                                                                # Driver to launch tests in browser.
  gem 'cucumber-rails', :require => false
  gem 'capybara-screenshot', '0.3.14'                                                               # Making sceenshots from capybara.
end

