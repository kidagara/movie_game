require "codeclimate-test-reporter"
CodeClimate::TestReporter.start

ENV["RAILS_ENV"] ||= "test"
require File.expand_path("../../config/environment", __FILE__)
require "rails/test_help"

require "minitest/autorun"
require "minitest/rails"
require "minitest/rails/capybara"
require "minitest/reporters"
require "database_cleaner"

Dir[File.expand_path("test/support/**/*.rb")].each { |file| require file }
Dir[File.expand_path("test/factories/**/*.rb")].each { |file| require file }

Minitest::Reporters.use! Minitest::Reporters::DefaultReporter.new(color: true)

OmniAuth.config.test_mode = true

OmniAuth.config.mock_auth[:facebook] = OmniAuth::AuthHash.new({
  provider: 'facebook',
  uid: '123545',
  info: {
    first_name: "Bob",
    last_name: "Billy",
    email: "bibblybob@bob.com"
  }
})

class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all

  def sign_in(user)
    cookies[:auth_token] = user.auth_token
  end

end
