class CreateProgramPublications < ActiveRecord::Migration
  def change
    create_table :program_publications do |t|
    	t.binary 'program_fullName',   :limit => 767, :null => false
    	t.binary 'program_publication',   :limit => 767, :null => false
    	t.binary 'program_publicationUrl',   :limit => 767, :null => false
    end

    add_index "program_publications", ["program_fullName"], :name => "fk_program_publications_1", :unique => true, :length => {"program_fullName" => 767}
  end
end
