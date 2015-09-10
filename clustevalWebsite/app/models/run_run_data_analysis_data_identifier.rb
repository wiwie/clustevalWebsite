class RunRunDataAnalysisDataIdentifier < ActiveRecord::Base
	belongs_to :repository
	# belongs_to :data_config
	belongs_to :run_run_data_analysis

  def self.all(session = nil, *args)
	if session
		return self.where("repository_id = ?",Repository.find(session))
	else
		return super()
	end
  end
end
