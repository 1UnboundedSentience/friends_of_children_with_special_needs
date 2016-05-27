require_dependency 'application_controller'

module Parent
  class ApplicationController < ::ApplicationController

    helper_method :current_student

    include ApplicationHelper

    def current_student
      current_user.students.first
    end

    private

    def redirect_to_root
      respond_to do |format|
        format.html { redirect_to root_url }
        format.js { render :js => "window.location.href='#{root_url}'" }
      end
    end

  end
end
