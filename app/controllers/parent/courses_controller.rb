require_dependency 'parent/application_controller'

module Parent
  class CoursesController < ApplicationController

    include BasketsHelper

    def index
      #TODO - do not show courses that they are registered for
      @courses = Course.within_age_group(current_student.age).active
    end

    def add_basket_item
      shopping_basket.add_item_to_basket(params[:course_id])
      store_basket_in_session
      redirect_to root_path
    end

    def remove_basket_item
      #TODO - if registration has been created and in waitlist mode, remove from registration?
      shopping_basket.remove_item_from_basket(params[:course_id])
      redirect_to root_path
    end
  end
end