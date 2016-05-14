class RegistrationsController < ApplicationController
  def index
    @parent = Parent.new(current_person)
    @students = @parent.students
  end

  def edit
  end

  def update
  end
end
