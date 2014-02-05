class RunResultsParameterOptimizationsQuality < ActiveRecord::Base
	belongs_to :repository
	belongs_to :clustering_quality_measure
	belongs_to :run_results_parameter_optimizations_parameter_set_iteration
  # attr_accessible :title, :body

  def self.all(session, *args)
	if session
		return self.find(:all, :conditions => ["repository_id = ?",Repository.find(session)])
	else
		return super.all
	end
  end
end
