require File.expand_path("../../test_helper", __FILE__)

class StudentTest < ActiveSupport::TestCase
  test "valid student" do
    student = students(:valid_student)
    assert student.valid?
    assert_equal people(:student_person), student.person
    assert_equal users(:parent), student.parent
  end
end
