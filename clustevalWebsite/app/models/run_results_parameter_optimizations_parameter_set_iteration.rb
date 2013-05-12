class RunResultsParameterOptimizationsParameterSetIteration < ActiveRecord::Base
	belongs_to :run_results_parameter_optimizations_parameter_set
	belongs_to :clustering
	has_many :run_results_parameter_optimizations_parameter_values
	has_many :run_results_parameter_optimizations_qualities
  # attr_accessible :title, :body
end
