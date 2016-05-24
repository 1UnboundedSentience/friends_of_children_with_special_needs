class StudentContactsController < ApplicationController

	# TODO - WRITE TESTS FOR THIS MODEL !!!

	def index
		@student = Student.find(params[:student_id])
		@studentContacts = StudentContact.where(:student_id => @student.id)
	end

	def new
		@studentContact = StudentContact.new(student_id: params[:student_id])
		@studentContact.build_person
	end

	def commit
		params.require(:commit)
	end

	def create
		@studentContact = StudentContact.new(sc_params)
		if commit == 'Save' && @studentContact.valid?
			@studentContact.save
			redirect_to student_contacts_path(student_id: @studentContact.student_id)
		elsif commit == 'Cancel'
			redirect_to student_contacts_path(student_id: @studentContact.student_id)
		else
			render 'new.html.erb'
		end
	end

	def edit
		@studentContact = StudentContact.find(params[:id])
	end

	def update
		@studentContact = StudentContact.find(params[:id])
		if commit == 'Save' && @studentContact.valid?
			#puts "SC_PARAMS update", sc_params
			@studentContact.update(relationship_to_student: sc_params[:relationship_to_student])
			person = Person.find(@studentContact.person_id)
			person.update(sc_params[:person_attributes])
			redirect_to student_contacts_path(student_id: @studentContact.student_id)
		elsif commit == 'Cancel'
			redirect_to student_contacts_path(student_id: @studentContact.student_id)
		else
			render 'edit.html.erb'
		end
	end

	def show
		@studentContact = StudentContact.find(params[:id])
	end

	def destroy
		@studentContact = StudentContact.find(params[:id])
		@studentContact.destroy
		redirect_to student_contacts_path(student_id: @studentContact.student_id)	
	end

	def sc_params
		params.require(:student_contact).permit(:relationship_to_student, :student_id, person_attributes: [:first_name, :last_name, :cell_phone, :home_phone, :work_phone, :email])
	end
end
