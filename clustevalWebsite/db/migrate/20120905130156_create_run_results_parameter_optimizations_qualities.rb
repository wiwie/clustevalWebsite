class CreateRunResultsParameterOptimizationsQualities < ActiveRecord::Migration
  def change
    create_table :run_results_parameter_optimizations_qualities do |t|

    t.integer "repository_id",                                                  :null => false
    t.integer "run_results_parameter_optimization_id", :null => false
    t.integer "run_results_parameter_optimizations_parameter_set_iteration_id", :null => false
    t.integer "clustering_quality_measure_id",                                  :null => false
    t.float   "quality",                                                        :null => false, :limit => 25
  end

  add_index "run_results_parameter_optimizations_qualities", ["clustering_quality_measure_id"], :name => "fk_parameter_optimization_qualities_4"
  add_index "run_results_parameter_optimizations_qualities", ["repository_id", "clustering_quality_measure_id", "run_results_parameter_optimizations_parameter_set_iteration_id"], :name => "index6", :unique => true
  add_index "run_results_parameter_optimizations_qualities", ["repository_id"], :name => "fk_parameter_optimization_qualities_1"
  add_index "run_results_parameter_optimizations_qualities", ["run_results_parameter_optimizations_parameter_set_iteration_id"], :name => "fk_parameter_optimization_qualities_2"
  add_index "run_results_parameter_optimizations_qualities", ["run_results_parameter_optimizations_parameter_set_iteration_id"], :name => "fk_parameter_optimization_qualities_3"
  add_index "run_results_parameter_optimizations_qualities", ["run_results_parameter_optimizations_parameter_set_iteration_id"], :name => "fk_run_results_parameter_optimizations_qualities_1"
  end
end
