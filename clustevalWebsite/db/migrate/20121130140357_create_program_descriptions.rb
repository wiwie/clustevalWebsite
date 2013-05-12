class CreateProgramDescriptions < ActiveRecord::Migration
  def change
    create_table :program_descriptions do |t|
    	t.string 'program_fullName',   :limit => 200, :null => false
    	t.string 'program_description',   :limit => 1000, :null => false
    end

    add_index "program_descriptions", ["program_fullName"], :name => "fk_program_descriptions_1", :unique => true
  end
end
