require 'test_helper'

class PostTest < ActiveSupport::TestCase

  setup do
    # Dunno why but active record give a crazy random ID
    @post = Post.new(title: "Test Article", content: 'a' * 200,
                     user_id: 11861604)
  end

  test "post should be valid" do
    assert @post.valid?, "#{@post.errors.each { |error| puts error }}
                          prevented valid post"
  end

  test "post should have a user_id" do
    @post.user_id = "   "
    assert_not @post.valid?, "App not validating association with user"
  end

  test "post should be only numbers" do
    @post.user_id = "blah"
    assert_not @post.valid?, "App not denying only letters in user_id"
    @post.user_id = "12gotcha"
    assert_not @post.valid?, "App not denying presence of leters at all"
  end

  test "post should require title" do
    @post.title = '   '
    assert_not @post.valid?, "App not requiring presence of title"
  end

  test "post should require unique title" do
    @post.save
    @duplicate = @post.dup
    assert_not @duplicate.valid?, "App not checking for title duplication"
  end

  test "post should limit title length" do
    @post.title = 'a' * 81
    assert_not @post.valid?, "App not limiting title length"
  end

  test "post should require content" do
    @post.content = '    '
    assert_not @post.valid?, "App not requiring post"
  end
end
