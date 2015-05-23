class CreatePrograms < ActiveRecord::Migration
  def change
    create_table :programs do |t|

	    t.integer "repository_id",                :null => false
	    t.binary  "abs_path",       :limit => 767, :null => false
	    t.binary  "alias",       :limit => 767, :null => false
	  end

	  add_index "programs", ["abs_path", "repository_id"], :name => "programs_name_UNIQUE", :unique => true, :length => {"abs_path" => 767}
	  add_index "programs", ["repository_id"], :name => "fk_programs_3"
  end
end
