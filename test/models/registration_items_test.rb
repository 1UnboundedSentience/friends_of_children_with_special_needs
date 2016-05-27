require 'test_helper'

class RegistrationItemsTest < ActiveSupport::TestCase
  test "valid registration items" do
    registration_item = registration_items(:valid_registration_item)
    assert registration_item.valid?
    assert_equal registrations(:valid_registration), registration_item.registration
    assert_equal courses(:active), registration_item.course
  end
end