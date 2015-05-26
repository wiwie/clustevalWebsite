class AddIndexToParamOptIterations < ActiveRecord::Migration
  def change
  	add_index "parameter_optimization_iterations", ["run_results_parameter_optimizations_parameter_set_iteration_id","iteration","param_set_as_string"], :name => "paramOptIts_k1"
  end
end
