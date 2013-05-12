class RunResultsInternalParameterOptimization < ActiveRecord::Base
	belongs_to :run_results_execution
  # attr_accessible :title, :body

	def to_param
		return self.run_results_execution.to_param
	end
end
