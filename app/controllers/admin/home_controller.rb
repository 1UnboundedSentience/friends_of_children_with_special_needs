module Admin
  class HomeController < ApplicationController

    layout false

    def index
      #TODO - modify this to use logged in user
      #TODO - modify layout from  admin views
      @current_user = User.where(is_coordinator: true).first
    end
  end
end
