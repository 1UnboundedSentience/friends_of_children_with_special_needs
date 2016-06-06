class Person < ActiveRecord::Base
  has_one :student
  has_one :user
   
  has_many :student_contacts
  has_many :student_relations, through: :student_contacts, source: :student

  default_scope {order(:last_name, :first_name)}

  def display_name
    first_name + " " + last_name
  end

  def self.by_display_name
    order(:display_name)
  end
end
