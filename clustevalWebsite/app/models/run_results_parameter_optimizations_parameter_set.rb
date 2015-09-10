class RunResultsParameterOptimizationsParameterSet < ActiveRecord::Base
	belongs_to :repository
	belongs_to :run_results_parameter_optimization
	has_many :run_results_parameter_optimizations_parameter_set_parameters
	has_many :run_results_parameter_optimizations_parameter_set_iterations
  # attr_accessible :title, :body

  def self.all(session = nil, *args)
	if session
		return self.where("repository_id = ?",Repository.find(session))
	else
		return super()
	end
  end
end
