module Admin
  class ApprovalsController < ApplicationController

    def index
      @course =  Course.where(id: params[:course_id]).first
      if @course
        #TODO Do not show registration items if they are in completed status
        @registration_items = RegistrationItem.by_course(@course.id)
      else
        #TODO - current_user needs to be set once auth is added. Remove the temp item below
        current_user = User.where(is_coordinator: true).first
        @registration_items = Course.by_coordinator(current_user).map(&:registration_items).flatten
      end
    end

    def update_status
      registration_item = RegistrationItem.where(id: params[:registration_item_id]).first
      registration_item.update_attributes(status: status_to_update(registration_item))
      redirect_to approvals_path
    end

    private

    def status_to_update(registration_item)
      registration_item.is_enrolled? ? RegistrationItem::STATUS[:ACCEPTED] : RegistrationItem::STATUS[:ENROLLED]
    end
  end
end