require 'test_helper'

class PostsControllerTest < ActionDispatch::IntegrationTest
  test "redirects logged in user" do
    post posts_url, params: { post: { title: "Blah", content: "Blah" } }
    assert_redirected_to root_url, "Server not validating log in"
  end
end
