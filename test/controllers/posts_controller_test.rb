require 'test_helper'

class PostsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:base)
    @post = posts(:first)
  end

  test "require log in to post" do
    assert_no_difference 'Post.count', "Server not validating log in" do
      post posts_url, params: { post: { title: "Blah", content: "Blah" } }
    end
    redirects_unlogged_user?
  end

  test "require log in to edit" do
    assert_no_difference 'Post.count', "Server not validating log in" do
      # Though the HTTP is put,Rails still uses Patch and other CRUD conventions
      patch post_path(@post), params: { post: { title: "First", content: "Ha!" } }
    end
    redirects_unlogged_user?
  end

  test "loads post with author image" do
    get post_path(@post)
    assert_response :success, "App not properly loading post"
    assert_select 'img.rounded', nil, "App not loading proper author image"
  end

  test "requires log in to delete" do
    assert_no_difference 'Post.count', "App not barring post deleting" do
      delete post_path(@post)
    end
    assert_not flash.empty?, "Not rendering warning flash"
  end

  test "loads all posts" do
    get posts_path
    assert_select 'div#post', count: 4, message: "App not rendering all articles"
    assert_select 'div#tag', count: 2, message: "App not rendering tags"
  end
end
