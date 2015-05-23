class CreateRuns < ActiveRecord::Migration
  def change
    create_table :runs do |t|

    t.integer "repository_id",                :null => false
    t.integer "run_type_id",                  :null => false
    t.integer "run_id"
    t.binary  "abs_path",       :limit => 767
    t.binary  "name",          :limit => 767
    t.string  "status",        :limit => 767, :null => false
  end

  add_index "runs", ["abs_path", "repository_id"], :name => "runs_abs_path_UNIQUE", :unique => true, :length => {"abs_path" => 767}
  add_index "runs", ["repository_id"], :name => "fk_runConfigs_1"
  add_index "runs", ["run_id"], :name => "fk_runs_2"
  add_index "runs", ["run_type_id"], :name => "fk_runs_1"
  end
end
