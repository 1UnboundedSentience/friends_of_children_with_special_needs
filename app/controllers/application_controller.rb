class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  # TODO - modify this method to return the current_student instance
  def current_student
  	@current_student = Student.first
  end

  # to make this method available in views
  helper_method :current_student 
end
