class CreateProfessor < ActiveRecord::Migration
  def change
  	create_table :professors do |p|
  		p.string :name
  	end
  end
end
