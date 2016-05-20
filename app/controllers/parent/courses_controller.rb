require_dependency 'parent/application_controller'

module Parent
  class CoursesController < ApplicationController

    def index
      @courses = Course.within_age_group(current_student.age).active
    end
  end
end