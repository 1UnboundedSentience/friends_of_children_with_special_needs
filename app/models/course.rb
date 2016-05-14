class Course < ActiveRecord::Base
  monetize :fees_in_cents, allow_nil: true

  belongs_to :instructor, class_name: "User", foreign_key: "instructor_id"
  belongs_to :coordinator, class_name: "User", foreign_key: "coordinator_id"

  has_many :course_dates
  has_many :course_times

  has_many :registrations
  has_many :students, through: :registrations

  def Course.for_student(student)
    where("? BETWEEN registration_start AND registration_end AND lowest_age < ? AND highest_age > ?", Time.now, student.age, student.age)
  end
end
