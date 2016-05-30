class ChangeRegistrationStatusDefault < ActiveRecord::Migration
  def up
    change_column :registrations, :status, :string, default: 'enrolled'
  end
end
