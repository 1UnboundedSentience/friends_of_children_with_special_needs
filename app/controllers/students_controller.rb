class StudentsController < ApplicationController

  #before_action :require_login, :except => [:new, :create]
  #before_action :require_current_user, :only => [:edit, :update, :destroy]
#TODO - do not allow student contacts to be added before adding stuidents
  def index
   @students = current_user.students
  end

  def show
    @student = Student.find(params[:id])
    @person = Person.find(@student.person_id)
  end

  def new
    @student = Student.new
    @person = Person.new
    @students = current_user.students
  end
    
  def edit
    @student = Student.find(params[:id])
    @person = Person.find(@student.person_id)
    @students = @person.student_relations
  end

  def create
    #TODO modify this
    #TODO:  handle addition of other parent
    @person = Person.new(first_name: params[:student][:person_attributes][:first_name],
    	                 last_name: params[:student][:person_attributes][:last_name])
    @student = Student.new(student_params)
    @student.person = @person
    @student.parent = current_user

    if @student.save
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
