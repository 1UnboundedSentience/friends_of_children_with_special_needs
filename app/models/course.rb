class Course < ActiveRecord::Base
  monetize :fees_in_cents, allow_nil: false,
           :numericality => {
              :greater_than_or_equal_to => 0
  }

  before_validation :build_course_dates, :build_course_times

  belongs_to :instructor, class_name: "User", foreign_key: "instructor_id"
  belongs_to :coordinator, class_name: "User", foreign_key: "coordinator_id"
  belongs_to :term

  has_many :course_dates
  has_many :course_times
  has_many :registration_items
  has_many :registrations, through: :registration_items
  has_many :students, through: :registrations

  attr_accessor :course_dates_str, :course_times_str

  scope :active, -> { where("? BETWEEN registration_start AND registration_end", Date.today)}
  scope :within_age_group, ->(age) {
    where("? BETWEEN lowest_age AND highest_age", age)
  }
  scope :by_coordinator, ->(coordinator_id) { where("coordinator_id = ?", coordinator_id) }
  scope :by_term, ->(term_id) { where("term_id = ?", term_id) }

  validates :instructor, presence: true
  validates :coordinator, presence: true
  validates :name, presence: true
  validates :term, presence: true
  validates :location, presence: true

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

  def build_course_dates
    return unless course_dates_str
    existing_course_dates = course_dates.map(&:date)
    course_dates_str.split(',').each do |date|
      course_dates << CourseDate.new(date: date) unless existing_course_dates.include? date
    end
  end

  def build_course_times
    return unless course_times_str
    existing_course_times = course_times.map(&:military_time)
    course_times_str.split(',').each do |military_time|
      course_times << CourseTime.new(military_time: military_time) unless existing_course_times.include? military_time
    end
  end
end

