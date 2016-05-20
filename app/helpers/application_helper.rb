module ApplicationHelper

  def humanize_course_dates(course)
    course.course_dates.to_a.map(&:date).join(",")
  end

  def humanize_course_times(course)
    course.course_times.to_a.map(&:military_time).join(",")
  end

  def humanize_money_from_cents(amount_in_cents, options = {})
    options = { precision: 2, delimiter: ',' }.merge(options)
    number_with_precision(amount_in_cents/100.0, options)
  end
end
