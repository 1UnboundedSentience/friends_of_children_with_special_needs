class DropCourseDatesTimes < ActiveRecord::Migration
  def change
    drop_table :course_dates
    drop_table :course_times
  end
end
