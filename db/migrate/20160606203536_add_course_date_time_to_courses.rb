class AddCourseDateTimeToCourses < ActiveRecord::Migration
  def change
    add_column :courses, :course_dates, :string
    add_column :courses, :course_times, :string
  end
end
