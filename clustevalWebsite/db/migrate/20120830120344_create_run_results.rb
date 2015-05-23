class CreateRunResults < ActiveRecord::Migration
  def change
    create_table :run_results do |t|

    t.integer  "repository_id",                       :null => false
    t.integer  "run_type_id",                         :null => false
    t.binary   "abs_path",             :limit => 7670, :null => false
    t.binary   "unique_run_identifier", :limit => 767,  :null => false
    t.integer  "run_id",                              :null => false
    t.datetime "date",                                :null => false
  end

  add_index "run_results", ["repository_id", "unique_run_identifier"], :name => "run_results_index3", :unique => true, :length => {"unique_run_identifier" => 767}
  add_index "run_results", ["repository_id"], :name => "fk_runResults_1"
  add_index "run_results", ["repository_id"], :name => "fk_run_results_1"
  add_index "run_results", ["run_id"], :name => "fk_run_results_3"
  add_index "run_results", ["run_type_id"], :name => "fk_run_results_2"
  end
end
