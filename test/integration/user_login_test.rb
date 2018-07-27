require 'test_helper'

class UserLoginTest < ActionDispatch::IntegrationTest
  test 'should handle invalid sign in' do
    get login_url
    assert_template 'sessions/new', "App not rendering the new session template"
    post login_path,
         params: { session: { email: 'jake.daddario@gmail.com', password: 'wrong' } }
    assert_template 'sessions/new', "App not redirecting on failure to sign in"
    assert_not flash.empty?, "App not rendering failure flash"
    get root_path
    assert flash.empty?, "The flash is not clearing on change"
  end

  test 'should handle valid user sign up' do
  end
end
