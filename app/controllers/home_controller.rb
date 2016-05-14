class HomeController < ApplicationController
  before_action :authenticate_user!

  def registration_confirmation
  end

   def show
  	@course = Course.find(@params.id)
  end
  


end