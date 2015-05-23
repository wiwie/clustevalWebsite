class CreateProgramDescriptions < ActiveRecord::Migration
  def change
    create_table :program_descriptions do |t|
    	t.binary 'program_fullName',   :limit => 767, :null => false
    	t.binary 'program_description',   :limit => 767, :null => false
    end

    add_index "program_descriptions", ["program_fullName"], :name => "fk_program_descriptions_1", :unique => true, :length => {"program_fullName" => 767}
  end
end
