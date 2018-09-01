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

  def login_write_post
    get login_url
    post login_url, params: { session: { email: "jake.daddario@gmail.com", password: "password"} }
    follow_redirect!
    get new_post_url
  end
end
