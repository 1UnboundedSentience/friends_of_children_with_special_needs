class Person < ActiveRecord::Base
  has_one :student
  has_one :user
  has_many :student_contacts
  has_many :student_relations, through: :student_contacts, source: :student
end
