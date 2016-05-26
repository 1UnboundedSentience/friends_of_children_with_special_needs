class RegistrationsController < ApplicationController
  # def index
  #   @parent = Parent.new(current_person)
  #   @students = @parent.students
  # end

  def create
    student = Student.find(params[:student_id])
    course = Course.find(params[:course_id])
    Registration.find_or_create_by(student: student, course: course)
    redirect_to registrations_path
  end

  def destroy
    registration = Registration.find(params[:id])
    registration.delete
    redirect_to registrations_path
  end
end

