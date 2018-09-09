require 'test_helper'

class TagTest < ActiveSupport::TestCase
  setup do
    @tagging = taggings(:base)
    @tag = Tag.new(name: 'food', tagging_id: @tagging.id)
  end

  test "valid tag" do
    assert @tag.valid?, "Base tag not valid. This is the problem"
  end

  test "requires name" do
    @base.name = '    '
    assert_not @tag.valid?, "Blank name not breaking testing suite"
  end

  test "requires a string input" do
    @base.name = 12
    assert_not @tag.valid?, "Not requiring a string input for tags"
  end
end
