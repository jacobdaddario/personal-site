require 'test_helper'

class WritingPostTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:base)
  end

  test "log in user and check that a post is building for him" do
    login_write_post
    assert_equal @user, current_user?, "App not making post owner current user"
  end

  test "write invalid post and have it redirect" do
    login_write_post
    post '/posts', params: { session: { title: "Nope", content: '   ' } }
    assert_template 'posts#new', "App not redirecting to new with error"
    assert_select 'input', "'   '", "App not retaining content in content field"
    assert_not flash.empty?, "App not rendering failure flash"
  end
end
