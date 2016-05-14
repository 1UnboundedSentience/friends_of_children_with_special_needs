class Person < ActiveRecord::Base
  has_one :student
  has_one :user

  def display_name
    first_name + " " + last_name
  end

end
