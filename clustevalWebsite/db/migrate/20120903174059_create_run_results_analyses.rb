class CreateRunResultsAnalyses < ActiveRecord::Migration
  def change
    create_table :run_results_analyses do |t|

    t.integer "repository_id", :null => false
    t.integer "run_result_id", :null => false
  end

  add_index "run_results_analyses", ["repository_id", "run_result_id"], :name => "index4", :unique => true
  add_index "run_results_analyses", ["repository_id"], :name => "fk_run_results_analyses_1"
  add_index "run_results_analyses", ["run_result_id"], :name => "fk_run_results_analyses_2"
  end
end
