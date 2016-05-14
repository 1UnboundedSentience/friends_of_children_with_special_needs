class RegistrationsController < ApplicationController
  def index
    @parent = Parent.new(current_person)
    @students = @parent.students
  end

  def edit
    @student = Student.find(params[:id])
    @course_assignment = @student.course_assignment
  end

  def update
  end
end
