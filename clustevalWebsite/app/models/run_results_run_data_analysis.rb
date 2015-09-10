class RunResultsRunDataAnalysis < ActiveRecord::Base
	belongs_to :repository
	belongs_to :run_results_analysis
  # attr_accessible :title, :body

	def to_param
		return self.run_results_analysis.to_param
	end

  def self.all(session = nil, *args)
	if session
		return self.where("repository_id = ?",Repository.find(session))
	else
		return super()
	end
  end
end
