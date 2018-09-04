require 'test_helper'

class WritingPostTest < ActionDispatch::IntegrationTest
  test "write invalid post and have it redirect" do
    login_write_post
    assert_no_difference 'Post.count', "App not denying invalid post" do
      post posts_url, params: { post: { title: "Nope", content: '   ' } }
    end
    assert_template 'posts/new', "App not redirecting to new with error"
    assert_select 'div.alert-danger', message: "Alert div not appearing"
    assert_select 'div#error_explanation', message: "Error explanation not appearing"
  end

  test "write valid post and have it redirect" do
    login_write_post
    assert_difference 'Post.count', 1, "App not adding post to DB" do
      post posts_url, params: { post: { title: "Yes", content: 'Yes'} }
    end
    follow_redirect!
    assert_template 'posts/show', "App not redirecting successful posts"
    assert_not flash.empty?, "App not rendering success flash"
  end
end
