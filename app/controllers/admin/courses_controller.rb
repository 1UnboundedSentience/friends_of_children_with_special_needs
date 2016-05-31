module Admin
  class CoursesController < ApplicationController

    def show
      @course = Course.find params[:id]
    end
  end
end