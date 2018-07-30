require 'test_helper'

class WritingPostTest < ActionDispatch::IntegrationTest
  test "write invalid post and have it redirect" do
    login_write_post
    assert_no_difference 'Post.count' do
      post posts_url, params: { post: { title: "Nope", content: '   ' } }
    end
    assert_template 'new', "App not redirecting to new with error"
    assert_select 'div.alert-danger'
    assert_select 'div#error_explanation'
  end

  # test "write valid post and have it redirect" do
  #   login_write_post
  #   post posts_url, params: { post: { title: "Yes", content: 'Yes'} }
  # end
end
