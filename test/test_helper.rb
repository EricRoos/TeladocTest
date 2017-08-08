require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'

class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all
  Rails.env

  # Add more helper methods to be used by all tests here...
  #
  require 'database_cleaner'

  DatabaseCleaner.strategy = :truncation
  DatabaseCleaner.clean
end
