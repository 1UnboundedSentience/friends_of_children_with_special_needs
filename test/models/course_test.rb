require 'test_helper'

class CourseTest < ActiveSupport::TestCase

  setup do
    @course = courses(:active)
    @course.instructor = users(:instructor)
    @course.coordinator = users(:coordinator)
    @course.course_dates = [course_dates(:valid_course_date)]
    @course.course_times = [course_times(:valid_course_time)]
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

  test 'course_dates is set' do
    assert_equal users(:instructor), @course.instructor
  end

  test 'course_times is set' do
    assert_equal users(:coordinator), @course.coordinator
  end

  test '#can_be_added' do
    registration = registrations(:valid_registration)
    registration_item = registration.registration_items.first
    course = registration_item.course
    student = registration.student
    refute course.can_be_added?(student.id)
  end
end
