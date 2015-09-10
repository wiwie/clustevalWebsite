class RunAnalysis < ActiveRecord::Base
	has_many :run_analysis_statistics
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
