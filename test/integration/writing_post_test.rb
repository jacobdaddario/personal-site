require 'test_helper'

class WritingPostTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:base)
    @post = posts(:first)
    log_in_as(@user, "password")
  end

  test "write invalid post and have it redirect" do
    assert_no_difference 'Post.count', "App not denying invalid post and associated tags" do
      post posts_url, params: { post: { title: "Nope", content: "   ", all_tags: "cats, dogs" } }
    end
    assert_template 'posts/new', "App not redirecting to new with error"
    assert_select 'div.alert-danger', message: "Alert div not appearing"
    assert_select 'div#error_explanation', message: "Error explanation not appearing"
  end

  test "write valid post and have it redirect" do
    assert_difference ->{ Post.count } => 1, ->{ Tagging.count } => 2, ->{ Tag.count } => 1 do
      post posts_url, params: { post: { title: "Yes", content: "Yes", all_tags: "cats, dogs" } }
    end
    follow_redirect!
    assert_template 'posts/show', "App not redirecting successful posts"
    assert_not flash.empty?, "App not rendering success flash"
    assert_select 'div.tag', 2, "Tags not appearing"
  end

  test "write invalid edited post and have it redirect" do
    patch post_path(@post), params: { post: { title: "Ooops", content: " ", all_tags: "cats, dogs" } }
    assert_template 'posts/edit', "App not redirecting to edit with error"
    assert_select 'div.alert-danger', message: "Alert div not appearing"
    assert_select 'div#error_explanation', message: "Error explanation not appearing"
  end

  test "write valid edit and see changes in the db" do
    patch post_path(@post), params: { post: { title: "Yes", content: "Yeet", all_tags: "cats, dogs" } }
    follow_redirect!
    @post.reload
    assert_equal "Yeet", @post.content, "App not updating post qualities"
    assert_template 'posts/show', "App not redirecting successful posts"
    assert_not flash.empty?, "App not rendering success flash"
  end

  test "deletes post and the associated tagging" do
    assert_difference ['Post.count', 'Tagging.count'], -1, "App not deleting tagging or post" do
      delete post_path(@post)
    end
    follow_redirect!
    assert_template 'posts/show', "App not properly redirecting"
    assert_not flash.empty?, "Not rendering success flash"
  end

end
