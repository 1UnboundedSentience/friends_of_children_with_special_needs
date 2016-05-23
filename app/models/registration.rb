class Registration < ActiveRecord::Base
  belongs_to :course
  belongs_to :student

  STATUS = {
      waitlist: 'waitlist',
      approved: 'approved'
  }
  has_many :registration_items
end
