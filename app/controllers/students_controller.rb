class StudentsController < ApplicationController

  #before_action :require_login, :except => [:new, :create]
  #before_action :require_current_user, :only => [:edit, :update, :destroy]

  def index
   @students = current_user.person.student_relations
  end

  def show
    @student = Student.find(params[:id])
    @person = Person.find(@student.person_id)
  end

  def new
    @student = Student.new
    @person = Person.new
    @students = current_user.person.student_relations
  end
    
  def edit
    @student = Student.find(params[:id])
    @person = Person.find(@student.person_id)
    @students = @person.student_relations
  end

  def create
    @person = Person.new(first_name: params[:student][:person_attributes][:first_name],
    	                 last_name: params[:student][:person_attributes][:last_name])
    @student = Student.new(student_params)
    @student.person = @person

    if @student.save
      #TODO - update the handling of this
      @student_contact = StudentContact.create(student_id: @student.id, person_id: current_user.person.id, 
      	                 relationship_to_student: "Parent")

      flash[:success] = "Student was added!"
      redirect_to new_student_path(@student)
    else
      flash[:alert] = "Student was not added!"
      render :new
    end

  end

  def update
  	@student = Student.find(params[:id])
    @person = Person.find(@student.person_id)

    if @student.update(student_params)
      flash[:success] = "Student information updated!"
      redirect_to edit_student_path(@student)
    else
      flash[:alert] = "Student information not updated!"
      render :edit
    end
  end

  def destroy

  end

  private
    def student_params

      params.require(:student).permit(
        :allergies,
        :diagnosis,
        :gender,
        :birthday,
        :one_on_one_aide,
        :behavior_intervention_plan,
        :comment,
        :talents,
        :person_id,
        {:person_attributes => [:first_name, :last_name]},
      )
    end

    def person_attr
      params[:student][:person_attributes]
    end
end
