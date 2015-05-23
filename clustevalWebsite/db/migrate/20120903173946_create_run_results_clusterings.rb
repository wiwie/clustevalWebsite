class CreateRunResultsClusterings < ActiveRecord::Migration
  def change
    create_table :run_results_clusterings do |t|

    t.integer "repository_id",                           :null => false
    t.integer "run_results_execution_id",                :null => false
    t.binary  "abs_path",                  :limit => 767
  end

  add_index "run_results_clusterings", ["repository_id", "run_results_execution_id", "abs_path"], :name => "run_results_clusterings_index4", :unique => true, :length => {"repository_id"=>nil, "run_results_execution_id"=>nil, "abs_path"=>200}
  add_index "run_results_clusterings", ["repository_id"], :name => "fk_run_results_clusterings_1"
  add_index "run_results_clusterings", ["run_results_execution_id"], :name => "fk_run_results_clusterings_2"
  end
end
