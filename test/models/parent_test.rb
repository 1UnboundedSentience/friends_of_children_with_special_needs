require File.expand_path("../../test_helper", __FILE__)

class ParentTest < ActiveSupport::TestCase
  test "children" do
    # mother = Parent.new(people(:mother))
    # assert_equal 2, mother.children.size
    # assert_equal ["Alice", "Bob"], mother.children.map(&:first_name).sort
  end
end
