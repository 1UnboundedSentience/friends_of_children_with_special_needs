require 'test_helper'

class UserTest < ActiveSupport::TestCase

  [:admin, :coordinator, :instructor, :parent, :multiple_roles].each do |role|
    test "test valid #{role}" do
      user = users(role)
      assert user.valid?
      assert_equal people(:user_person), user.person
    end
  end

  test 'parent-student association' do
    user = users(:parent)
    assert user.students.size > 0
  end
 end
