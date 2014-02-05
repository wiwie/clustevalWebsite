class RunResultsParameterOptimizationsParameterSetParameter < ActiveRecord::Base
	belongs_to :repository
	belongs_to :program_parameter
	belongs_to :run_results_parameter_optimizations_parameter_set
	has_many :run_results_parameter_optimizations_parameter_values
  # attr_accessible :title, :body

  def self.all(session, *args)
	if session
		return self.find(:all, :conditions => ["repository_id = ?",Repository.find(session)])
	else
		return super.all
	end
  end
end
