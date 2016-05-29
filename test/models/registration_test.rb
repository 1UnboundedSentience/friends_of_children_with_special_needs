require 'test_helper'

class RegistrationTest < ActiveSupport::TestCase
  test "valid registraions" do
    registration = registrations(:valid_registration)
    assert registration.valid?
    assert_equal 1, registration.registration_items.count
    assert_equal students(:valid_student), registration.student
  end

  test "signature validation" do
    registration = registrations(:invalid_registration_without_signature)
    refute registration.valid?
    assert_match /can't be blank/, registration.errors[:signature_svg].first
  end
end
