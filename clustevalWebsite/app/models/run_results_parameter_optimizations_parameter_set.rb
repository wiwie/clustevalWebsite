class RunResultsParameterOptimizationsParameterSet < ActiveRecord::Base
	belongs_to :repository
	belongs_to :run_results_parameter_optimization
	has_many :run_results_parameter_optimizations_parameter_set_parameters
	has_many :run_results_parameter_optimizations_parameter_set_iterations
  # attr_accessible :title, :body

  def self.all(session, *args)
	if session
		return self.find(:all, :conditions => ["repository_id = ?",Repository.find_by_basePath(session[:repository_id]).id])
	else
		return super.all
	end
  end
end
