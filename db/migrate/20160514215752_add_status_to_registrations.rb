class AddStatusToRegistrations < ActiveRecord::Migration
  def change
    add_column :registrations, :status, :string, default: 'waitlist'
  end
end
