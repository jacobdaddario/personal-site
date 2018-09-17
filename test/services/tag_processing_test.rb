require 'test_helper'

# Active support offers TestCase to create a minitest class that also has
# the typical Rails extensions to the package
class TagProcessingTest < ActiveSupport::TestCase
  setup do
    @params = { post: { tags: 'food, cats, dogs, books' } }
  end

  test "saves new tags to the db" do
    assert_difference ['Tag.count'], 1, "App not properly separating saved and unsaved tags or saving them to the db #{@tags}" do
      @tags = TagProcessing.call(@params)
    end
  end

  test "returns tags for assocation creation" do
    assert_equal @params[:post][:tags].split(','), TagProcessing.call(@params), "Not returning tags for the controller to process"
  end
end