require 'test_helper'

class StaticPagesControllerTest < ActionDispatch::IntegrationTest
  test "should get home" do
    get root_url
    assert_response :success
    assert_select "title", "Home - Jacob Daddario",
                  "Site title is not displaying correctly"
  end

  test "should get contact" do
    get "/contact"
    assert_response :success
    assert_select "title", "Contact - Jacob Daddario",
                  "Site title is not displaying correctly"
  end

  test "should find author image" do
    # TODO
  end

end
