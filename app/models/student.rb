class Student < ActiveRecord::Base
  belongs_to :person
  has_many :student_contacts

  has_many :registrations
  has_many :courses, through: :registrations
end
