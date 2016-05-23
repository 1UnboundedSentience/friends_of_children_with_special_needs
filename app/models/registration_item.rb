class RegistrationItem < ActiveRecord::Base
  belongs_to :course
  belongs_to :student
  belongs_to :registration
end