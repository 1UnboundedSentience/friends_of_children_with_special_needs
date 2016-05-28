class HomeController < ApplicationController
  before_action :authenticate_user!

   def show
  	@course = Course.find(params[:id])
  	@instructor = @course.instructor_name
  	@coordinator = @course.coordinator_name
  end

  def index
    #assumption for MVP of the app is that only one child is a special needs child
    student = current_user.students.first
    @registration_items = student.registration_items
  end
end
