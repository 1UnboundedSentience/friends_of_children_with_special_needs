require_dependency 'parent/application_controller'

module Parent
  class RegistrationsController < ApplicationController

    include BasketsHelper

    def new
      @registration = Registration.new
      @courses = shopping_basket.items.map(&:course)
    end

    def create
      registration = build_registration
      if registration.save
        flash[:success] = 'You have successfully registered for classes with FCSN! Check your email for details'
        redirect_to root_path
      else
        render :new
      end
    end

    private

    def build_registration
      registration = Registration.new(photo_waiver: params[:photo_waiver],
                                      signature_svg: params[:signature_svg],
                                      student_id: current_student.id)
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
      #TODO: why are these not coming with registration? Fix this and modify build_registration
      params.permit(:photo_waiver, :signature_svg)
    end
  end
end
