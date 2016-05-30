class Registration < ActiveRecord::Base
  belongs_to :course
  belongs_to :student

  STATUS = {
      enrolled: 'enrolled',
      approved: 'approved'
  }
  has_many :registration_items

  delegate :name, to: :student, prefix: 'student'
end
