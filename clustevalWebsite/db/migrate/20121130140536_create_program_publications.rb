class CreateProgramPublications < ActiveRecord::Migration
  def change
    create_table :program_publications do |t|
    	t.string 'program_fullName',   :limit => 200, :null => false
    	t.string 'program_publication',   :limit => 1000, :null => false
    	t.string 'program_publicationUrl',   :limit => 1000, :null => false
    end

    add_index "program_publications", ["program_fullName"], :name => "fk_program_publications_1", :unique => true
  end
end
