require 'test_helper'

class PostTest < ActiveSupport::TestCase

  setup do
    # Associations and integration testing is why good top-down fixtures in
    # progress
    @user = users(:base)
    @post = Post.new(title: "Test Article", content: 'a' * 200,
                     user_id: @user.id)
  end

  test "accepts a valid post" do
    assert @post.valid?, "Base post should be valid. #{@post.errors.details}"
  end

  test "requires association with user" do
    @post.user_id = "   "
    assert_not @post.valid?, "App not validating association with user"
  end

  test "requires correct foreign key" do
    @post.user_id = "blah"
    assert_not @post.valid?, "App not denying only letters in user_id"
    @post.user_id = "12gotcha"
    assert_not @post.valid?, "App not denying presence of letters at all"
  end

  test "requires title" do
    @post.title = '   '
    assert_not @post.valid?, "App not requiring presence of title"
  end

  test "requires unique title" do
    @post.save
    duplicate = @post.dup
    assert_not duplicate.valid?, "App not checking for title duplication"
  end

  test "title length maximum 80" do
    @post.title = 'a' * 81
    assert_not @post.valid?, "App not limiting title length"
  end

  test "requires content" do
    @post.content = '    '
    assert_not @post.valid?, "App not requiring post"
  end

  test "sorts by descending order" do
    @post = posts(:most_recent)
    assert_equal @post, Post.first, "The app is not sorting the Posts it pulls"
  end
end
