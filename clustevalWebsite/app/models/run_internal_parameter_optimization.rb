class RunInternalParameterOptimization < ActiveRecord::Base
	belongs_to :repository
	belongs_to :run_execution

	def to_param
  		return self.run_execution.to_param
	end

  def self.all(session, *args)
	if session
		return self.find(:all, :conditions => ["repository_id = ?",Repository.find_by_basePath(session[:repository_id]).id])
	else
		return super.all
	end
  end
end
