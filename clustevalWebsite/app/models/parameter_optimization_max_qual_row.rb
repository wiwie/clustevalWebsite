class ParameterOptimizationMaxQualRow < ActiveRecord::Base
	belongs_to :program
	belongs_to :dataset
	belongs_to :run_results_parameter_optimizations_parameter_set_iteration
  # attr_accessible :title, :body
end
