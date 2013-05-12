class CreateRunResultsParameterOptimizationsParameterValues < ActiveRecord::Migration
  def change
    create_table :run_results_parameter_optimizations_parameter_values do |t|

    t.integer "repository_id",                                                                 :null => false
    t.integer "run_results_parameter_optimization_id",                :null => false
    t.integer "run_results_parameter_optimizations_parameter_set_iteration_id",                :null => false
    t.integer "run_results_parameter_optimizations_parameter_set_parameter_id",                :null => false
    t.binary  "value",                                                          :limit => 200, :null => false
  end

  add_index "run_results_parameter_optimizations_parameter_values", ["repository_id"], :name => "fk_parameter_set_values_3"
  add_index "run_results_parameter_optimizations_parameter_values", ["run_results_parameter_optimizations_parameter_set_iteration_id"], :name => "fk_run_results_parameter_optimizations_parameter_values_1"
  add_index "run_results_parameter_optimizations_parameter_values", ["run_results_parameter_optimizations_parameter_set_parameter_id", "run_results_parameter_optimizations_parameter_set_iteration_id", "repository_id"], :name => "index2", :unique => true
  add_index "run_results_parameter_optimizations_parameter_values", ["run_results_parameter_optimizations_parameter_set_parameter_id"], :name => "fk_parameter_optimizations_parameter_values_1"
  add_index "run_results_parameter_optimizations_parameter_values", ["run_results_parameter_optimizations_parameter_set_parameter_id"], :name => "fk_parameter_set_parameters_2"
  end
end
