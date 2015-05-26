class AddIndexToParamOptIterations3 < ActiveRecord::Migration
  def change
  	add_index "parameter_optimization_iterations", ["data_config_id","program_config_id","iteration","run_results_parameter_optimizations_parameter_set_iteration_id","param_set_as_string"], :name => "paramOptIts_k3"
  end
end
