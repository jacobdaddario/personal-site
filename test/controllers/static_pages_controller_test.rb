require 'test_helper'

class StaticPagesControllerTest < ActionDispatch::IntegrationTest
  test "should get home" do
    get root_url
    assert_response :success
    assert_select 'title', "Home - Jacob Daddario",
                  "Site title is not displaying correctly"
  end

  test "should get contact" do
    get contact_url
    assert_response :success
    assert_select 'title', "Contact - Jacob Daddario",
                  "Site title is not displaying correctly"
  end

  # Dynamically fetches image. Wanted to double check this
  test "should find author image" do
    get root_url
    # Checks that the controller is assigning users
    assert assigns[:user]
  end
end
