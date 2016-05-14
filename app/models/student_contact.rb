class StudentContact < ActiveRecord::Base
  belongs_to :student
  belongs_to :person

  RELATIONSHIP_TO_STUDENT_ROLES = {
    mother: "Mother",
    father: "Father",
    emergency_contact: "Emergency Contact"
  }

  def self.emergency_contact_role
    RELATIONSHIP_TO_STUDENT_ROLES[:emergency_contact]
  end

  def self.mother_role
    RELATIONSHIP_TO_STUDENT_ROLES[:mother]
  end

  def self.father_role
    RELATIONSHIP_TO_STUDENT_ROLES[:father]
  end
end
