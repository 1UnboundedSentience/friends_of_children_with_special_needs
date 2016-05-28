require File.expand_path("../../test_helper", __FILE__)

class StudentTest < ActiveSupport::TestCase
  test "valid student" do
    student = students(:valid_student)
    assert student.valid?
    assert_equal people(:student_person), student.person
    assert_equal users(:parent), student.parent
    assert_equal 1, student.registrations.count
    assert_equal "Student Metz", student.display_name
  end

  test "#registrations" do
    student = students(:valid_student)
    assert_equal 1, student.registrations.count
  end

  test "#registration_items" do
    student = students(:valid_student)
    assert_equal 1, student.registration_items.count
  end
end
