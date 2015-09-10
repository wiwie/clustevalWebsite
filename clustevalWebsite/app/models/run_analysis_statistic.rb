class RunAnalysisStatistic < ActiveRecord::Base
	belongs_to :repository
	belongs_to :run_analysis
	belongs_to :statistic

  def self.all(session = nil, *args)
	if session
		return self.where("repository_id = ?",Repository.find(session))
	else
		return super()
	end
  end
end
