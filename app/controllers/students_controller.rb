class StudentsController < ApplicationController

  before_action :require_login, :except => [:new, :create]
  before_action :require_current_user, :only => [:edit, :update, :destroy]

  def show
  end

  def new
  	puts "Current User #{current_user.email}"
    @student = Student.new
    @person = Person.new
    @students = current_user.person.student_relations
  end
    
  def edit
  end

  def create
    @person = Person.new(first_name: params[:student][:person_attributes][:first_name],
    	                 last_name: params[:student][:person_attributes][:last_name])

    @student = Student.new(student_params)
    @student.person = @person
    if @student.save
      @student_contact = StudentContact.create(student_id: @student.id, person_id: current_user.person.id, 
      	                 relationship_to_student: "Parent")

      flash[:success] = "Student was registered successfully!"
      redirect_to new_student_path(@student)
    else
      flash[:alert] = "Student was not registered!"
      render :new
    end

  end

  def update
  end

  def destroy

  end

  private

    # Never trust parameters from the scary internet, only allow the white list through.
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

end
