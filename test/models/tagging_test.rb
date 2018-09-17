require 'test_helper'

class TaggingTest < ActiveSupport::TestCase
  setup do
    @tagging = Tagging.new(post_id: posts(:most_recent).id,
                           tag_id: tags(:food).id)
  end

  test "valid tagging" do
    assert @tagging.valid?, "The base tag is invalid in the test"
  end

  test "requires post id" do
    @tagging.post_id = nil
    assert_not @tagging.valid?, "The tagging should require a post id"
  end

  test "requires tag id" do
    @tagging.tag_id = nil
    assert_not @tagging.valid?, "The tagging should require a tag id"
  end
end
