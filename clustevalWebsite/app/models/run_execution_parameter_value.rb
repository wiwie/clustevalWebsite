class RunExecutionParameterValue < ActiveRecord::Base
	belongs_to :repository
	belongs_to :program_config
	belongs_to :program_parameter
	belongs_to :run_execution

	def to_param
  		"#{abs_path}".split('/')[-1].tr('.runconfig','')
	end

  def self.all(session, *args)
	if session
		return self.find(:all, :conditions => ["repository_id = ?",Repository.find(session)])
	else
		return super.all
	end
  end
end
