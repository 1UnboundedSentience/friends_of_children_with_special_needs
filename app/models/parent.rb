class Parent
	def initialize(person)
		@person = person
	end

	def children
		contacts = StudentContact.where(person_id: @person.id, relationship_to_student: ["StudentContact.mother_role", "StudentContact.father_role"])
		#byebug
		contacts.map(&:student).map(&:person)
	end


end