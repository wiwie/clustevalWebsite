class RunRunDataAnalysisDataIdentifier < ActiveRecord::Base
	belongs_to :repository
	# belongs_to :data_config
	belongs_to :run_run_data_analysis

  def self.all(session, *args)
	if session
		return self.find(:all, :conditions => ["repository_id = ?",Repository.find(session)])
	else
		return super.all
	end
  end
end
