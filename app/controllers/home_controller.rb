class HomeController < ApplicationController
  before_action :authenticate_user!

  def registration_confirmation
  end

<<<<<<< HEAD
   def show
  	@course = Course.find(params[:id])
  	@instructor = @course.instructor_name
  	@coordinator = @course.coordinator_name
  end

=======
>>>>>>> 9234fcabe6be62322a84becae8bfffd14227e119
  def index
    @registrations = Registration.all
  end
end
