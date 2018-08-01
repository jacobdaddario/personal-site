require 'test_helper'

class TagTest < ActiveSupport::TestCase
  setup do
    @tag = Tag.new(content: "test")
  end

  test "tag should be valid" do
    assert @tag.valid?, "Base tag element should be valid"
  end

  test "tag should have content" do
    @tag.content = '    '
    assert_not @tag.valid?, "Tag not validating content presence"
  end
end
