class RunExecutionDataConfig < ActiveRecord::Base
	belongs_to :repository
	belongs_to :data_config
	belongs_to :run_execution

	def to_param
  		"#{abs_path}".split('/')[-1].tr('.runconfig','')
	end

  def self.all(session = nil, *args)
	if session
		return self.where("repository_id = ?",Repository.find(session))
	else
		return super()
	end
  end
end
