require 'test_helper'

class CourseTest < ActiveSupport::TestCase

  setup do
    @course = courses(:active)
    @course.instructor = users(:instructor)
    @course.coordinator = users(:coordinator)
    @course.save
    @course.reload
  end

  test 'valid course' do
    assert @course.valid?
  end

  test 'instructor is set' do
    assert_equal users(:instructor), @course.instructor
  end

  test 'coordinator is set' do
    assert_equal users(:coordinator), @course.coordinator
  end

  test 'term is set' do
    assert_equal terms(:active_term), @course.term
  end

  test '#can_be_added' do
    registration = registrations(:valid_registration)
    registration_item = registration.registration_items.first
    course = registration_item.course
    student = registration.student
    refute course.can_be_added?(student.id)
  end
end
