require 'test_helper'

class TagTest < ActiveSupport::TestCase
  setup do
    @tag = Tag.new(name: 'dancing')
  end

  test "valid tag" do
    assert @tag.valid?, "Base tag not valid. This is the problem"
  end

  test "requires name" do
    @tag.name = '    '
    assert_not @tag.valid?, "Blank name not breaking testing suite"
  end

  # Prevents accidental duplication of tags
  test "requires a unique name" do
    @tag.save
    @dup_tag = @tag.dup
    assert_not @dup_tag.valid?, "Not requiring a unique name for the tag"
  end
end
