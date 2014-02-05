class RunDataAnalysisDataConfig < ActiveRecord::Base
	belongs_to :repository
	belongs_to :run_data_analysis
	belongs_to :data_config

	def to_param
  		"#{absPath}".split('/')[-1].tr('.runconfig','')
	end

  def self.all(session, *args)
	if session
		return self.find(:all, :conditions => ["repository_id = ?",Repository.find(session)])
	else
		return super.all
	end
  end
end
