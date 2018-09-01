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

  test "should find author image" do
    get root_url
    assert_select 'img.rounded', nil,
                  "Site not fetching author image"
  end

  test "should find links to contact on home" do
    get root_url
    assert_select 'a[href=?]', '/contact', 4,
                  "Contact links are missing"
  end
end
