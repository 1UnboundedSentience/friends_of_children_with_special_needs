require_dependency 'parent/application_controller'

module Parent
  class RegistrationsController < ApplicationController

    include BasketsHelper

    def new
      @registration = Registration.new
      @courses = shopping_basket.items.map(&:course)
    end

    def create
      @registration = build_registration
      if @registration.save
        flash[:success] = 'You have successfully registered for classes with FCSN! Check your email for details'
        redirect_to root_path
      else
        flash[:alert] = @registration.errors.full_messages.to_sentence
        render :new
      end
    end

    private

    def build_registration
      registration = Registration.new(registration_params.merge(student_id: current_student.id))
      items = []
      shopping_basket.items.each {|sbi|
        items << (RegistrationItem.new(
                  course_id: sbi.course.id,
                  registration: registration))
      }
      registration.registration_items = items
      registration
    end

    def registration_params
      params.require(:registration).permit(:photo_waiver, :signature_svg)
    end
  end
end
