class Student < ActiveRecord::Base
  belongs_to :person
  has_many :student_contacts

  has_many :registrations
  has_many :courses, through: :registrations

  def name
    person.name
  end

  def course_assignment
    courses_available = Course.for_student(self)
    Hash[courses_available.map {|course| [course, { registered: courses.include?(course), registration: registrations.find_by(course_id: course.id)} ]}]
  end

  def age
    now = Time.now.utc.to_date
    now.year - birthday.year - ((now.month > birthday.month || (now.month == birthday.month && now.day >= birthday.day)) ? 0 : 1)
  end
end
