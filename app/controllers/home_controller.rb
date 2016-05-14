class HomeController < ApplicationController
  before_action :authenticate_user!

  def registration_confirmation
  end
  
end