class CreateRunConfigsRunDataAnalyses < ActiveRecord::Migration
  def change
    create_table :run_run_data_analyses do |t|

    t.integer "repository_id",       :null => false
    t.integer "run_analysis_id", :null => false
  end

  add_index "run_run_data_analyses", ["repository_id", "run_analysis_id"], :name => "index4", :unique => true
  add_index "run_run_data_analyses", ["repository_id"], :name => "fk_runs_analysis_run_data_1"
  add_index "run_run_data_analyses", ["run_analysis_id"], :name => "fk_runs_analysis_run_data_2"
  add_index "run_run_data_analyses", ["run_analysis_id"], :name => "fk_runs_run_data_analyses_1"
  end
end
