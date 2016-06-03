class RegistrationItem < ActiveRecord::Base

  belongs_to :course
  belongs_to :registration

  delegate :photo_waiver, :status, to: :registration
  delegate :name, to: :course, prefix: "course"

  default_scope {order('created_at DESC')}
  scope :by_course, ->(course_id) { where("course_id = ?", course_id) }
end