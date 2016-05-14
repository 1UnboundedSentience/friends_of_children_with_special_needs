class RegistrationsController < Devise::RegistrationsController
 
  def new
    build_resource({})
    self.resource.person = Person.new
    respond_with self.resource
  end
 
  def create
    super
    person=params["user"]["people"]
    Person.create!({first_name: person["first_name"], 
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
  end
 
  private
 
  def sign_up_params
    allow = [:first_name,:email, :password, :password_confirmation]
    params.require(resource_name).permit(allow)
  end
  
end