module Admin
  class CoursesController < ApplicationController

    def show
      @course = Course.where(id: params[:id]).first
    end
  end
end