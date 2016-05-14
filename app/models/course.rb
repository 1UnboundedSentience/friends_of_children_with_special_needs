class Course < ActiveRecord::Base
  monetize :fees_in_cents, allow_nil: true

  belongs_to :instructor, class_name: "User", foreign_key: "instructor_id"
  belongs_to :coordinator, class_name: "User", foreign_key: "coordinator_id"

  has_many :course_dates
  has_many :course_times

  has_many :registrations
  has_many :students, through: :registrations

  def instructor_name
  	instructor.person.display_name
  end

  def coordinator_name
  	coordinator.person.display_name
  end
  
end

