module Admin
  class ApprovalsController < ApplicationController

    def index
      course_id = params[:approvals][:course_id] if params[:approvals]
      if course_id
        @course = Course.where(id: course_id).first
        @registration_items = RegistrationItem.by_course(course_id)
      end
    end
  end
end