class CreateSubject < ActiveRecord::Migration
  def change
  	create_table :subjects do |s|
  		s.string :name
  	end
  end
end
