module Admin
  class CoursesController < ApplicationController

    def show
      @course = Course.where(id: params[:id]).first
    end

    def index
      #TODO add filter criteria and paging
      @courses = Course.all
    end

    def new
      @course = Course.new
    end

    def edit
      @course = Course.where(id: params[:id]).first
    end

    def create
      @course = Course.new(course_params)
      if @course.save
        flash[:success] = "Successfully created course"
        redirect_to course_path(@course)
      else
        flash[:error] = @course.errors.full_messages.to_sentence
        render action: "new"
      end
    end

    def update
      @course = Course.where(id: params[:id]).first
      if @course.update_attributes(params[:course])
        flash[:success] = "Successfully updated course."
        redirect_to admin_courses_path
      else
        flash[:error] = @course.errors.full_messages.to_sentence
        render action: "edit"
      end
    end

    def destroy
      @course = Course.where(id: params[:id]).first
      #TODO do not allow deletion if there are registrations using the course
      @course.destroy
      flash[:notice] = "Successfully deleted course."
      redirect_to courses_index_path
    end

    private

    def course_params
      params.require(:course).permit(:name, :description)
    end
  end
end