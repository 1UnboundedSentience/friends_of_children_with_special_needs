require 'test_helper'

class RegistrationItemsTest < ActiveSupport::TestCase
  test "valid registration items" do
    registration_item = registration_items(:valid_registration_item)
    assert registration_item.valid?
    assert_equal registrations(:valid_registration), registration_item.registration
    assert_equal courses(:active), registration_item.course
    assert registration_item.photo_waiver
    assert_equal RegistrationItem::STATUS[:ENROLLED], registration_item.status
    assert_equal "Art class", registration_item.course_name
    assert_equal "Student Metz", registration_item.registration.student_display_name
    assert registration_item.is_enrolled?
    refute registration_item.is_accepted?
  end
end