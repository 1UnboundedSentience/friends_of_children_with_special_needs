class Course < ActiveRecord::Base
  monetize :fees_in_cents, allow_nil: true

  #todo add validation that name, instrucotr, coordinator etc are required

  belongs_to :instructor, class_name: "User", foreign_key: "instructor_id"
  belongs_to :coordinator, class_name: "User", foreign_key: "coordinator_id"
  belongs_to :term

  has_many :course_dates
  has_many :course_times
  has_many :registration_items
  has_many :registrations, through: :registration_items
  has_many :students, through: :registrations

  scope :active, -> { where("? BETWEEN registration_start AND registration_end", Date.today)}
  scope :within_age_group, ->(age) {
    where("? BETWEEN lowest_age AND highest_age", age)
  }
  scope :by_coordinator, ->(coordinator_id) { where("coordinator_id = ?", coordinator_id) }
  scope :by_term, ->(term_id) { where("term_id = ?", term_id) }

  def Course.for_student(student)
    where("? BETWEEN registration_start AND registration_end AND lowest_age < ? AND highest_age > ?", Time.now, student.age, student.age)
  end

  def instructor_name
  	instructor.person.display_name
  end

  def coordinator_name
  	coordinator.person.display_name
  end

  def can_be_added?(student_id)
    students.map(&:id).exclude?(student_id)
  end
end

