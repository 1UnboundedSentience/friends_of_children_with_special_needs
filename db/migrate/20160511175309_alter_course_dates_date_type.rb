class AlterCourseDatesDateType < ActiveRecord::Migration
  def change
    change_column :course_dates, :date, :string
  end
end
