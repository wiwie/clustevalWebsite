class RunAnalysis < ActiveRecord::Base
	has_many :run_analysis_statistics
	belongs_to :repository
	belongs_to :run

	def to_param
  		return self.run.to_param
	end

  def self.all(session, *args)
	if session
		return self.find(:all, :conditions => ["repository_id = ?",Repository.find_by_basePath(session[:repository_id]).id])
	else
		return super.all
	end
  end
end
