class AddTermIdToCourse < ActiveRecord::Migration
  def change
    add_column :courses, :term_id, :integer
  end
end
