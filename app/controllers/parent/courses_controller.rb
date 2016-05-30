require_dependency 'parent/application_controller'

module Parent
  class CoursesController < ApplicationController

    include BasketsHelper

    def index
      @courses =
          Course.within_age_group(current_student.age).active.select{|course| course.can_be_added?(current_student.id)}
    end

    def add_basket_item
      shopping_basket.add_item_to_basket(params[:course_id])
      store_basket_in_session
      redirect_to course_selection_path
    end

    def remove_basket_item
      shopping_basket.remove_item_from_basket(params[:course_id])
      redirect_to course_selection_path
    end
  end
end