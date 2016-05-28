class RegistrationItem < ActiveRecord::Base
  belongs_to :course
  belongs_to :registration

  delegate :photo_waiver, :status, to: :registration
  delegate :name, to: :course, prefix: "course"
end