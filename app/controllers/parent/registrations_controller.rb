require_dependency 'parent/application_controller'

module Parent
  class RegistrationsController < ApplicationController

    include BasketsHelper

    def new
      @registration = Registration.new
      @courses = shopping_basket.items.map(&:course)
    end

    def create
      puts "BAMBAM in here"
      redirect_to root_path
    end
  end
end
