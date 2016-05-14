class Person < ActiveRecord::Base
  has_one :student
  has_one :user
   
  has_many :student_contacts
  has_many :student_relations, through: :student_contacts, source: :student


  def display_name
    self.first_name + " " + self.last_name
  end

end
