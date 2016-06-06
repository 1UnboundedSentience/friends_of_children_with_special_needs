module Admin
  class CoursesController < ApplicationController

    def show
      @course = Course.where(id: params[:id]).first
    end

    def index
      #TODO add filter criteria and paging
      @courses = Course.all
      # if current_user.is_admin?
      #   @courses = Course.all
      # elsif current_user.is_coordinator?
      #   @courses = Course.by_coordinator current_user.id
      # end
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
        flash[:alert] = @course.errors.full_messages.to_sentence
        render action: "new"
      end
    end

    def update
      @course = Course.where(id: params[:id]).first
      if @course.update_attributes(course_params)
        flash[:success] = "Successfully updated course."
        redirect_to courses_path
      else
        flash[:error] = @course.errors.full_messages.to_sentence
        render action: "edit"
      end
    end

    def destroy
      @course = Course.where(id: params[:id]).first
      if @course.registrations.size > 0
        flash[:alert] = "Course has registrations and cannot be deleted"
      else
        @course.destroy
        flash[:notice] = "Successfully deleted course."
      end
      redirect_to courses_path
    end

    private

    def course_params
      params.require(:course).permit(
          :name, :description, :location, :instructor_id, :comments, :coordinator_id, :term_id, :fees_in,
          :registration_start, :registration_end, :lowest_age, :highest_age, :course_dates_str, :course_times_str)
    end
  end
end