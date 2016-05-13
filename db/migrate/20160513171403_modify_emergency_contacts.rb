class ModifyEmergencyContacts < ActiveRecord::Migration
  def change
    rename_table :emergency_contacts, :student_contacts

    add_column :student_contacts, :relationship_to_student, :string
    add_column :student_contacts, :emergency_contact_order, :integer
  end
end
