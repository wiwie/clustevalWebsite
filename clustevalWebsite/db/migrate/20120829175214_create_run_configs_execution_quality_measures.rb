class CreateRunConfigsExecutionQualityMeasures < ActiveRecord::Migration
  def change
    create_table :run_execution_quality_measures do |t|

    t.integer "repository_id",                 :null => false
    t.integer "run_execution_id",              :null => false
    t.integer "clustering_quality_measure_id", :null => false
  end

  add_index "run_execution_quality_measures", ["clustering_quality_measure_id"], :name => "fk_runConfigsExecutionQualityMeasures_2"
  add_index "run_execution_quality_measures", ["repository_id", "run_execution_id", "clustering_quality_measure_id"], :name => "index5", :unique => true
  add_index "run_execution_quality_measures", ["repository_id"], :name => "fk_runConfigsExecutionQualityMeasures_1"
  add_index "run_execution_quality_measures", ["run_execution_id"], :name => "fk_run_execution_quality_measures_1"
  add_index "run_execution_quality_measures", ["run_execution_id"], :name => "fk_runs_execution_quality_measures_1"
  end
end
