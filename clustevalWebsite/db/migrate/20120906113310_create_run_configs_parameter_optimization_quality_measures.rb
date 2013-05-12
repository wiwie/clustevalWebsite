class CreateRunConfigsParameterOptimizationQualityMeasures < ActiveRecord::Migration
  def change
    create_table :run_parameter_optimization_quality_measures do |t|

    t.integer "repository_id",                 :null => false
    t.integer "run_parameter_optimization_id", :null => false
    t.integer "clustering_quality_measure_id", :null => false
  end

  add_index "run_parameter_optimization_quality_measures", ["clustering_quality_measure_id"], :name => "fk_runs_parameter_optimization_quality_measures_3"
  add_index "run_parameter_optimization_quality_measures", ["repository_id", "run_parameter_optimization_id", "clustering_quality_measure_id"], :name => "index2", :unique => true
  add_index "run_parameter_optimization_quality_measures", ["repository_id"], :name => "fk_runs_parameter_optimization_quality_measures_1"
  add_index "run_parameter_optimization_quality_measures", ["run_parameter_optimization_id"], :name => "fk_runs_parameter_optimization_quality_measures_2"
  end
end
