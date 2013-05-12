class CreatePrograms < ActiveRecord::Migration
  def change
    create_table :programs do |t|

	    t.integer "repository_id",                :null => false
	    t.binary  "absPath",       :limit => 200, :null => false
	    t.binary  "alias",       :limit => 200, :null => false
	  end

	  add_index "programs", ["absPath", "repository_id"], :name => "name_UNIQUE", :unique => true, :length => {"absPath" => 200}
	  add_index "programs", ["repository_id"], :name => "fk_programs_3"
  end
end
