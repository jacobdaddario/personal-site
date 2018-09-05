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

  test 'log in followed by successful log out' do
    get login_url
    post login_path,
         params: { session: { email: 'jake.daddario@gmail.com', password: 'password' } }
    follow_redirect!
    assert_template 'static_pages/home', "App not redirecting home"
    assert is_logged_in?,
           "The app is not registering the current user as being logged in"
    assert_select 'a[href=?]', '/logout', "Log Out",
                  "App not rendering logout link"
    assert_select 'a[href=?]', '/login', { text: "Log In", count: 0 },
                  "App not removing login link"
    assert_select 'a.nav-item', 4, "App not rendering all conditional links"
    assert_not flash.empty?, "The app is not issuing a success message"
    get root_url
    assert flash.empty?, "The app is not removing the flash on new request"
    delete logout_path
    assert_redirected_to root_url, "App not redirecting correctly"
    follow_redirect!
    assert_select 'a[href=?]', '/logout', { text: "Log Out", count: 0 },
                   "App not removing log out"
    assert_select 'a.nav-item', 3, "App not rendering conditional links proprely"
    assert_not flash.empty?, "App not rendering logout flash"
    get root_path
    assert flash.empty?, "App not removing flash correctly"
  end
end
