require_dependency 'application_controller'

module Parent
  class ApplicationController < ::ApplicationController

    helper_method :current_student, :current_parent

    include ApplicationHelper

    def current_parent
      #TODO
      @parent ||= User.where(is_parent: true).first
    end

    def current_student
      current_parent.students.first
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
