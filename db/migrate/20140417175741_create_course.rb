class CreateCourse < ActiveRecord::Migration
  def change
  	create_table :courses do |c|
  		c.string :name
  		c.date :start_date
  		c.date :end_date
  		c.integer :professor_id
  		c.integer :subject_id
  	end
  end
end
