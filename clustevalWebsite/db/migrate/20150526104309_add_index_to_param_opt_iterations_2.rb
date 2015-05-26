class AddIndexToParamOptIterations2 < ActiveRecord::Migration
  def change
  	add_index "parameter_optimization_iterations", ["iteration","run_results_parameter_optimizations_parameter_set_iteration_id","param_set_as_string"], :name => "paramOptIts_k2"
  end
end
