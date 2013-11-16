# This file is copied to spec/ when you run 'rails generate rspec:install'
ENV["RAILS_ENV"] ||= 'test'
require File.expand_path("../../config/environment", __FILE__)
require 'rspec/rails'
require 'rspec/autorun'
require 'capybara/rspec'

# Requires supporting ruby files with custom matchers and macros, etc,
# in spec/support/ and its subdirectories.
Dir[Rails.root.join("spec/support/**/*.rb")].each {|f| require f}

# Using chrome as browser to test in capybara.
# Capybara.register_driver :selenium do |app|
#   Capybara::Selenium::Driver.new(app, :browser => :chrome)
# end

# Disabling stderr (this cleans tests output).
Capybara.register_driver :webkit do |app|
  Capybara::Webkit::Driver.new(app, :stderr => nil)
end

Capybara.javascript_driver = :webkit

# RSpec config.
RSpec.configure do |config|
  # Disable garbage collector to speed up the test suit.
  config.before(:all) { DeferredGarbageCollection.start }
  config.after(:all)  { DeferredGarbageCollection.reconsider }

  config.include Devise::TestHelpers, :type => :controller
  # ## Mock Framework
  #
  # If you prefer to use mocha, flexmock or RR, uncomment the appropriate line:
  #
  # config.mock_with :mocha
  # config.mock_with :flexmock
  # config.mock_with :rr

  # Remove this line if you're not using ActiveRecord or ActiveRecord fixtures
  config.fixture_path = "#{::Rails.root}/spec/fixtures"

  # If you're not using ActiveRecord, or you'd prefer not to run each of your
  # examples within a transaction, remove the following line or assign false
  # instead of true.
  config.use_transactional_fixtures = false

  # If true, the base class of anonymous controllers will be inferred
  # automatically. This will be the default behavior in future versions of
  # rspec-rails.
  config.infer_base_class_for_anonymous_controllers = false

  # New setting for Capybara.
  config.include Capybara::DSL

  # Clean test database.
  config.before(:suite) do
    DatabaseCleaner.strategy = :truncation
  end

  config.before(:each) do
    DatabaseCleaner.start
  end

  config.after(:each) do
    DatabaseCleaner.clean
  end

  # Helper to sign in user
  def test_sign_in( user )
    controller.sign_in( user )
  end
end
