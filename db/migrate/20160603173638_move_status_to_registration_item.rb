class MoveStatusToRegistrationItem < ActiveRecord::Migration
  def change
    remove_column :registrations, :status
    add_column :registration_items, :status, :string
  end
end
