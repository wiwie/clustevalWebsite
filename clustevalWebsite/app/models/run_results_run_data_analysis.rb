class RunResultsRunDataAnalysis < ActiveRecord::Base
	belongs_to :repository
	belongs_to :run_results_analysis
  # attr_accessible :title, :body

	def to_param
		return self.run_results_analysis.to_param
	end

  def self.all(session, *args)
	if session
		return self.find(:all, :conditions => ["repository_id = ?",Repository.find_by_basePath(session[:repository_id]).id])
	else
		return super.all
	end
  end
end
