require 'test_helper'

class PostsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @post = posts(:first)
  end

  test "redirects logged in user" do
    post posts_url, params: { post: { title: "Blah", content: "Blah" } }
    assert_redirected_to root_url, "Server not validating log in"
  end

  # Bruh IDK why, but I have a ton of issues with these tests
end
