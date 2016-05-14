require 'test_helper'

class StudentContactTest < ActiveSupport::TestCase

  test "emergency contact" do
    emergency_contact = student_contacts(:emergency_contact)

    assert emergency_contact.valid?

    assert_equal students(:valid_student), emergency_contact.student
    assert_equal people(:user_person), emergency_contact.person
  end

  test "mother" do
    mother = student_contacts(:mother)
    assert mother.valid?

    assert_equal students(:valid_student), mother.student
    assert_equal people(:user_person), mother.person
  end

  test "father" do
    father = student_contacts(:father)
    assert father.valid?

    assert_equal students(:valid_student), father.student
    assert_equal people(:user_person), father.person
  end
end
