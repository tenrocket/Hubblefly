class CreateStudy < ActiveRecord::Migration
  def change
  	create_table :studies do |s|
  		s.string :description
  	end
  end
end
