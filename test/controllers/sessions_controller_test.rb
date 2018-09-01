require 'test_helper'

class SessionsControllerTest < ActionDispatch::IntegrationTest

  test "should get new" do
    get login_url
    assert_response :success
    assert_select 'title', "Log In - Jacob Daddario", "App not adding title right"
  end

end
