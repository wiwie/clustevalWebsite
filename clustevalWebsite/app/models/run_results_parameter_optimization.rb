class RunResultsParameterOptimization < ActiveRecord::Base
	has_many :run_results_parameter_optimizations_parameter_set_parameters
	has_many :run_results_parameter_optimizations_parameter_values
	has_many :run_results_parameter_optimizations_qualities
	has_one :run_results_parameter_optimizations_parameter_set
	belongs_to :repository
	belongs_to :data_config
	belongs_to :program_config
	belongs_to :run_results_execution
  # attr_accessible :title, :body

	def to_param
		return self.run_results_execution.to_param
	end

  def self.all(session = nil, *args)
	if session
		return self.where("repository_id = ?",Repository.find(session))
	else
		return super()
	end
  end
end
