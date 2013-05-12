class CreateRunResultsParameterOptimizationsParameterSets < ActiveRecord::Migration
  def change
    create_table :run_results_parameter_optimizations_parameter_sets do |t|

    t.integer "repository_id",                         :null => false
    t.integer "run_results_parameter_optimization_id", :null => false
  end

  add_index "run_results_parameter_optimizations_parameter_sets", ["repository_id"], :name => "fk_parameter_sets_1"
  add_index "run_results_parameter_optimizations_parameter_sets", ["repository_id"], :name => "fk_run_results_parameter_optimizations_parameter_sets_2"
  add_index "run_results_parameter_optimizations_parameter_sets", ["run_results_parameter_optimization_id"], :name => "fk_run_results_parameter_optimizations_parameter_sets_1"
  end
end
