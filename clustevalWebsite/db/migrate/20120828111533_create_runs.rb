class CreateRuns < ActiveRecord::Migration
  def change
    create_table :runs do |t|

    t.integer "repository_id",                :null => false
    t.integer "run_type_id",                  :null => false
    t.integer "run_id"
    t.binary  "absPath",       :limit => 200
    t.binary  "name",          :limit => 200
    t.string  "status",        :limit => 200, :null => false
  end

  add_index "runs", ["absPath", "repository_id"], :name => "absPath_UNIQUE", :unique => true, :length => {"absPath" => 200}
  add_index "runs", ["repository_id"], :name => "fk_runConfigs_1"
  add_index "runs", ["run_id"], :name => "fk_runs_2"
  add_index "runs", ["run_type_id"], :name => "fk_runs_1"
  end
end
