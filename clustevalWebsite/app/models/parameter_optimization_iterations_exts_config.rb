class ParameterOptimizationIterationsExtsConfig < ActiveRecord::Base
	self.primary_keys = :run_results_parameter_optimizations_parameter_set_iteration_id, :clustering_quality_measure_id
	belongs_to :program
	belongs_to :program_config
	belongs_to :dataset
	belongs_to :data_config
	belongs_to :clustering_quality_measure
	belongs_to :run_results_parameter_optimizations_parameter_set_iteration
end
