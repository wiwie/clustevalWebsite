class CreateRunResultsRunAnalyses < ActiveRecord::Migration
  def change
    create_table :run_results_run_analyses do |t|

    t.integer "repository_id",           :null => false
    t.integer "run_results_analysis_id", :null => false
  end

  add_index "run_results_run_analyses", ["repository_id", "run_results_analysis_id"], :name => "index4", :unique => true
  add_index "run_results_run_analyses", ["repository_id"], :name => "fk_runResultsRunAnalysis_1"
  add_index "run_results_run_analyses", ["run_results_analysis_id"], :name => "fk_runResultsRunAnalysis_2"
  end
end
