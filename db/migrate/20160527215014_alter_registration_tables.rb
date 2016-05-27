class AlterRegistrationTables < ActiveRecord::Migration
  def change
    remove_column :registration_items, :student_id
    add_column :registrations, :student_id, :integer
  end
end
