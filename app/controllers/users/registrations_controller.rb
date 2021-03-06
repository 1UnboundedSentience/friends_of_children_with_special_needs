class Users::RegistrationsController < Devise::RegistrationsController

  def new
    build_resource({})
    self.resource.person = Person.new
    respond_with self.resource
  end

  def create
    super
    #TODO - look at this issue
    person=params["user"]["people"]
    @p = Person.create!({first_name: person["first_name"],
    	             last_name: person["last_name"],
    	             address_line_1: person["address_line_1"],
    	             address_line_2: person["address_line_2"],
    	             city:  person["city"],
    	             state: person["state"],
    	             postal_code: person["postal_code"],
    	             home_phone:  person["home_phone"],
    	             work_phone:  person["work_phone"],
    	             cell_phone:  person["cell_phone"],
    	             email: params["user"]["email"]
    })
    #binding.pry
    user = User.find_by(email: params["user"]["email"])
    #user.save!(person_id: @p.id)
    #redirect user to logged in show page
  end

  def after_sign_up_path_for(resource)
    #'/students/new'
    new_student_path
  end

end
