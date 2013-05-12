class CreateRunResultsParameterOptimizationsParameterSetIterations < ActiveRecord::Migration
  def change
    create_table :run_results_parameter_optimizations_parameter_set_iterations do |t|

    t.integer "repository_id",                                                                 :null => false
    t.integer "run_results_parameter_optimizations_parameter_set_id",                :null => false
    t.integer "iteration",                                                           :null => false
    t.integer "clustering_id"
    t.binary  "paramSetAsString",                                     :limit => 200, :null => false
  end

  add_index "run_results_parameter_optimizations_parameter_values", ["repository_id"], :name => "fk_parameter_set_parameters_3"
  add_index "run_results_parameter_optimizations_parameter_set_iterations", ["clustering_id"], :name => "fk_2"
  add_index "run_results_parameter_optimizations_parameter_set_iterations", ["iteration", "run_results_parameter_optimizations_parameter_set_id"], :name => "index3", :unique => true
  add_index "run_results_parameter_optimizations_parameter_set_iterations", ["run_results_parameter_optimizations_parameter_set_id"], :name => "fk_1"
  end
end
