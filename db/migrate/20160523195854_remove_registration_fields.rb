class RemoveRegistrationFields < ActiveRecord::Migration
  def change
    remove_column :registrations, :course_id
    remove_column :registrations, :student_id
  end
end
