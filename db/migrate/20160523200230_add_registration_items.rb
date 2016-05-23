class AddRegistrationItems < ActiveRecord::Migration
  def change
    create_table :registration_items do |t|
      t.integer :registration_id
      t.integer :course_id
      t.integer :student_id

      t.timestamps null: false
    end
  end
end
