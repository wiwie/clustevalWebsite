class RunRunDataAnalysis < ActiveRecord::Base
	belongs_to :repository
	belongs_to :run_analysis
	has_many :run_run_data_analysis_data_identifiers
	has_many :run_run_data_analysis_run_identifiers

	def to_param
  		return self.run_analysis.to_param
	end

  def self.all(session = nil, *args)
	if session
		return self.where("repository_id = ?",Repository.find(session))
	else
		return super()
	end
  end
end
