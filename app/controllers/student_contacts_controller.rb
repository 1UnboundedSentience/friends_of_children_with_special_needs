class StudentContactsController < ApplicationController

	# TODO - WRITE TESTS FOR THIS MODEL !!!

	def index
		@studentContacts = StudentContact.all
	end

	def new
		@studentContact = StudentContact.new(student_id: current_student.id)
		@studentContact.build_person
	end

	def commit
		params.require(:commit)
	end

	def create
		@studentContact = StudentContact.new(sc_params)
		if commit == 'Save' && @studentContact.valid?
			@studentContact.save
			redirect_to student_contacts_path
		elsif commit == 'Cancel'
			redirect_to student_contacts_path
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
			@studentContact.update(sc_params)
			redirect_to student_contacts_path
		elsif commit == 'Cancel'
			redirect_to student_contacts_path
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
		redirect_to student_contacts_path	
	end

	def sc_params
		params.require(:student_contact).permit(:relationship_to_student, :student_id, person_attributes: [:first_name, :last_name, :cell_phone, :home_phone, :work_phone, :email])
	end
end
