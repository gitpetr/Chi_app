source 'https://rubygems.org'

gem 'rails', '3.2.8'
gem 'pg', '0.13.2'                                                                        # Connect to postgreSQL.
gem 'jquery-rails', '2.1.1'
gem 'haml', '3.1.7'
gem 'therubyracer', :platform => :ruby
gem 'devise', '2.1.0'                                                                     # Easy auth.
gem 'simple_form', '2.0.2'                                                                # Super simple forms with bootstrap look support.

# Gems used only for assets and not required
# in production environments by default.
# See https://github.com/sstephenson/execjs#readme for more supported runtimes
# gem 'therubyracer', :platforms => :ruby
group :assets do
  gem 'sass-rails',   '~> 3.2.4'
  gem 'coffee-rails', '~> 3.2.2'
  gem 'twitter-bootstrap-rails', :git => 'git://github.com/seyhunak/twitter-bootstrap-rails.git' # I use this version (2.1.2) from git because it supports bootstrap 2.1.0 right now.
  gem 'uglifier', '>= 1.2.3'
end

group :development do
  gem 'annotate', '2.5.0'
end

group :development, :test do
  gem 'rspec-rails'
  gem 'rb-fsevent'
  gem 'guard-rspec'                                                                       # Rspec for guard.
  gem 'ruby_gntp'
end

group :test do
  gem 'capybara', '1.1.2'                                                                 # Browser automation for rspec.
  gem 'factory_girl', '~> 4.0'
  gem "factory_girl_rails", "~> 4.0"
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
