class Parent
  def initialize(person)
    @person = person
  end

  def students
    contacts = StudentContact.where(person_id: @person.id, relationship_to_student: ["StudentContact.mother_role", "StudentContact.father_role"])
    contacts.map(&:student)
  end

  def children
    students.map(&:person)
  end
end
