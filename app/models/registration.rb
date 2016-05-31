class Registration < ActiveRecord::Base

  belongs_to :student
  has_many :registration_items
  STATUS = {
      enrolled: 'enrolled',
      approved: 'approved',
      completed: 'completed'
  }
  delegate :name, to: :student, prefix: 'student'

  validates :signature_svg, presence: true
end
