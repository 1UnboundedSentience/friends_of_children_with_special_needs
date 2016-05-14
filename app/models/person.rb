class Person < ActiveRecord::Base
  has_one :student
  has_one :user

  def display_name
    self.first_name + " " + self.last_name
  end
end
