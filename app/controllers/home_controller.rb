class HomeController < ApplicationController
  before_action :authenticate_user!

  def registration_confirmation
  end

   def show
  	@course = Course.find(params[:id])
  	@instructor = @course.instructor_name
  	@coordinator = @course.coordinator_name
  end

  def index
    #TODO - should only be of the parent
    @registration = Registration.first
    @registration_items = RegistrationItem.all
  end
end
