class RunParameterOptimizationMethod < ActiveRecord::Base
	belongs_to :repository
	belongs_to :run_parameter_optimization
	belongs_to :parameter_optimization_method
	belongs_to :clustering_quality_measure
	belongs_to :program_config
  # attr_accessible :title, :body

  def self.all(session = nil, *args)
	if session
		return self.where("repository_id = ?",Repository.find(session))
	else
		return super()
	end
  end
end
