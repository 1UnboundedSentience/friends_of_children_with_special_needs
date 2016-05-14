class HomeController < ApplicationController
  before_action :authenticate_user!

  def index
    @registrations = Registration.all
  end
end
