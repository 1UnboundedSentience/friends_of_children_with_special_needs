class Student < ActiveRecord::Base
  belongs_to :person
  has_many :student_contacts

  has_many :person_relations, through: :student_contacts, source: :person

  has_many :registrations
  has_many :courses, through: :registrations

  accepts_nested_attributes_for :person,
    :allow_destroy => true,
    :reject_if     => :all_blank

  accepts_nested_attributes_for :student_contacts,
    :allow_destroy => true,
    :reject_if     => :all_blank    
end
