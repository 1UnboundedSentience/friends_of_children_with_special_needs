class CoursesController < ApplicationController
def age(dob)
  now = Time.now.utc.to_date
  now.year - dob.year - ((now.month > dob.month || (now.month == dob.month && now.day >= dob.day)) ? 0 : 1)
end
  def index
  	student = Student.first
  	aa = age(Student.first.birthday)
  	@courses = Course.where("? BETWEEN registration_start AND registration_end AND lowest_age < ? AND highest_age > ?", Time.now, aa, aa)
  end

end
