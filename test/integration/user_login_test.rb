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
    get login_url
    assert_template 'sessions/new', "App not rendering the new session template"
    post login_path,
         params: { session: { email: 'jake.daddario@gmail.com', password: 'foobar' } }
    follow_redirect!
    assert_template 'static_pages/home', "App not redirecting home"
    assert is_logged_in?,
           "The app is not registering the current user as being logged in"
    assert_select 'a[href=?]', '/logout', "Log Out",
                  "App not rendering logout link"
    assert_select 'a[href=?]', '/login', { text: "Log In", count: 0 },
                  "App not removing login link"
    assert_select 'a.nav-hover', 4, "App not rendering all conditional links"
    assert_not flash.empty?, "The app is not issuing a success message"
    get root_url
    assert flash.empty?, "The app is not removing the flash on new request"
  end
end
