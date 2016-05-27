class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  belongs_to :person

  has_many :students

  accepts_nested_attributes_for :person
  def students
    if (is_parent)
        contacts = StudentContact.where(person_id: person.id,
                                        relationship_to_student: ["StudentContact.mother_role",
                                                                  "StudentContact.father_role",
                                                                  "Mother",
                                                                  "Father"])
        contacts.map(&:student)
    end
  end
end
