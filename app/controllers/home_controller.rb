class HomeController < ApplicationController
  before_action :authenticate_user!

  def registration_confirmation
  end

  def index
    @registrations = Registration.all
  end
end
