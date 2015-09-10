
class RunExecution < ActiveRecord::Base
	has_many :run_execution_data_configs
	has_many :run_execution_program_configs
	has_many :run_execution_parameter_values
	has_many :run_execution_quality_measures
	belongs_to :repository
	belongs_to :run

	def to_param
  		return self.run.to_param
	end

  def self.all(session = nil, *args)
	if session
		return self.where("repository_id = ?",Repository.find(session))
	else
		return super()
	end
  end
end
