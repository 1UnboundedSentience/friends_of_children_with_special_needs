class AlterCourseTimesTimeType < ActiveRecord::Migration
  def change
    rename_column :course_times, :seconds_since_midnight, :military_time
    change_column :course_times, :military_time, :string
  end
end
