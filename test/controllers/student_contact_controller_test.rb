require 'test_helper'

class StudentContactsControllerTest < ActionController::TestCase
  
  def setup
    @student = students(:valid_student)
    @student_contact = student_contacts(:student_contact_1)
  end

  test "should get index for valid_student" do
    get :index, 'student_id' => @student.id
    assert_response :success
  end

  test "should get show for student_contact_1" do
    get :show, 'id' => @student_contact.id
    assert_response :success
  end

  test "should get edit for student_contact_1" do
    get :edit, 'id' => @student_contact.id
    assert_response :success
  end
end
