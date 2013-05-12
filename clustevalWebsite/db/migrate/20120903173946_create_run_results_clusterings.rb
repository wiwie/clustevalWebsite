class CreateRunResultsClusterings < ActiveRecord::Migration
  def change
    create_table :run_results_clusterings do |t|

    t.integer "repository_id",                           :null => false
    t.integer "run_results_execution_id",                :null => false
    t.binary  "absPath",                  :limit => 200
  end

  add_index "run_results_clusterings", ["repository_id", "run_results_execution_id", "absPath"], :name => "index4", :unique => true, :length => {"repository_id"=>nil, "run_results_execution_id"=>nil, "absPath"=>200}
  add_index "run_results_clusterings", ["repository_id"], :name => "fk_run_results_clusterings_1"
  add_index "run_results_clusterings", ["run_results_execution_id"], :name => "fk_run_results_clusterings_2"
  end
end
