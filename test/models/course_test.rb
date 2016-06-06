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

  test 'builds_course_dates from valid CSV string' do
    assert_course_dates('2014-03-14, 2015-07-23', courses(:active).course_dates.size + 2)
  end

  test 'builds_course_dates with empty value' do
    assert_course_dates('', courses(:active).course_dates.size)
  end

  def assert_course_dates(input_str, expected_size)
    course = courses(:active)
    course.course_dates_str = input_str
    course.build_course_dates
    assert_equal course.course_dates.size, expected_size
  end

  test 'builds_course_times from valid CSV string' do
    assert_course_times('15:30, 13:30', courses(:active).course_times.size + 2)
  end

  test 'builds_course_times with empty value' do
    assert_course_times('', courses(:active).course_times.size)
  end

  def assert_course_times(input_str, expected_size)
    course = courses(:active)
    course.course_times_str = input_str
    course.build_course_times
    assert_equal course.course_times.size, expected_size
  end
end
