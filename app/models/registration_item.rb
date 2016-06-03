class RegistrationItem < ActiveRecord::Base

  belongs_to :course
  belongs_to :registration

  delegate :photo_waiver, to: :registration
  delegate :name, to: :course, prefix: "course"

  default_scope {order('created_at DESC')}
  scope :by_course, ->(course_id) { where("course_id = ?", course_id) }
  scope :by_instructor, ->(instructor_id){joins(users).where(course)}
  STATUS = {
      ENROLLED: 'enrolled',
      ACCEPTED: 'accepted',
      COMPLETED: 'completed'
  }

  def is_enrolled?
    status == STATUS[:ENROLLED]
  end

  def is_accepted?
    status == STATUS[:ACCEPTED]
  end
end