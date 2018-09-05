ENV['RAILS_ENV'] ||= 'test'
require_relative '../config/environment'
require 'rails/test_help'
require "minitest/reporters"
Minitest::Reporters.use!

class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all

  # Add more helper methods to be used by all tests here...
  def is_logged_in?
    !session[:id].nil?
  end

  def current_user?
    @current_user = User.find(session[:id])
  end

  def redirects_unlogged_user?
    assert_response :redirect, "App not allowing posts"
    assert_redirected_to root_url, "Server not redirecting malicious user"
    assert_not flash.empty?, "Warning flash not rendering"
  end

  # Used in integration tests
  def log_in_as(user, password)
    get login_url
    post login_url, params: { session: { email: user.email, password: password } }
    follow_redirect!
  end
end
