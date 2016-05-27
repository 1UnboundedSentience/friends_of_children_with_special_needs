require 'test_helper'

class RegistrationTest < ActiveSupport::TestCase
  test "valid registraions" do
    registration = registrations(:valid_registration)
    assert registration.valid?
    assert_equal 1, registration.registration_items.count
  end
end
