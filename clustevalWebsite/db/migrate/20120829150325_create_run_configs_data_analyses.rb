class CreateRunConfigsDataAnalyses < ActiveRecord::Migration
  def change
    create_table :run_data_analyses do |t|

    t.integer "repository_id",   :null => false
    t.integer "run_analysis_id", :null => false
  end

  add_index "run_data_analyses", ["repository_id", "run_analysis_id"], :name => "index4", :unique => true
  add_index "run_data_analyses", ["repository_id"], :name => "fk_runConfigsAnalysisData_1"
  add_index "run_data_analyses", ["run_analysis_id"], :name => "fk_runConfigsAnalysisData_2"
  end
end
