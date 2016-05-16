class Users::RegistrationsController < Devise::RegistrationsController
 
  def new
    build_resource({})
    self.resource.person = Person.new
    respond_with self.resource
  end
 
  def create
    super
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
    user_id = @p.id
    user = User.find_by(email: params["user"]["email"])
    user.update!(person_id: user_id)

  end
  def after_sign_up_path_for(resource)
    #'/students/new' 
    new_student_path
  end
  
end
