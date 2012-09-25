source 'https://rubygems.org'

gem 'rails', '3.2.8'
gem 'pg', '0.13.2'                                                                        # Connect to postgreSQL.
gem 'jquery-rails', '2.1.1'
gem 'haml', '3.1.7'
gem 'therubyracer', :platform => :ruby
gem 'devise', '2.1.0'                                                                     # Easy authentication.
gem 'simple_form', '2.0.2'                                                                # Super simple forms with bootstrap look support.
gem 'bootstrap-wysihtml5-rails', '0.3.1'                                                  # Rich text editor via JS.
gem 'kaminari', '0.14.0'                                                                  # Be very carefull with changing version of this gem (i modified a lot generated views).
gem "cancan", '1.6.8'                                                                     # Authorization library.
gem "carrierwave"                                                                         # Simple file uploading.
gem "rmagick"                                                                             # Powerfull image manipulation. Don't forget to install imagemagick before that!

# Gems used only for assets and not required
# in production environments by default.
# See https://github.com/sstephenson/execjs#readme for more supported runtimes
# gem 'therubyracer', :platforms => :ruby
group :assets do
  gem 'sass-rails',   '~> 3.2.4'
  gem 'coffee-rails', '~> 3.2.2'
  gem "twitter-bootstrap-rails", "~> 2.1.3"
  gem 'uglifier', '>= 1.2.3'
end

group :development do
  gem 'annotate', '2.5.0'
end

group :development, :test do
  gem 'rspec-rails', '2.10.1'
  gem 'rb-fsevent'
  gem 'guard-rspec'                                                                       # Rspec for guard.
  gem 'terminal-notifier-guard'                                                           # Notification via notification center.
  gem 'launchy'                                                                           # This gem allow us to open testing page in browser (save_and_open_page method)
end

group :test do
  gem 'capybara'                                                                            # Browser automation for rspec with js support.
  gem "factory_girl_rails", "~> 4.0"
  gem 'database_cleaner'
end

# To use ActiveModel has_secure_password
# gem 'bcrypt-ruby', '~> 3.0.0'

# To use Jbuilder templates for JSON
# gem 'jbuilder'

# Use unicorn as the app server
# gem 'unicorn'

# Deploy with Capistrano
# gem 'capistrano'

# To use debugger
# gem 'debugger'
