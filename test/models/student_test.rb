require File.expand_path("../../test_helper", __FILE__)

class StudentTest < ActiveSupport::TestCase
  test "valid student" do
    student = students(:valid_student)
    assert student.valid?
    assert_equal people(:student_person), student.person
    assert_equal users(:parent), student.parent
    assert student.registrations.count > 0
    assert_equal "Student Metz", student.display_name
  end

  test "#registrations" do
    student = students(:valid_student)
    assert student.registrations.count > 0
  end

  test "#registration_items" do
    student = students(:valid_student)
    assert student.registration_items.count > 0
  end
end
