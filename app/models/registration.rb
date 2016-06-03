class Registration < ActiveRecord::Base

  belongs_to :student
  has_many :registration_items

  delegate :display_name, to: :student, prefix: 'student'

  validates :signature_svg, presence: true
end
