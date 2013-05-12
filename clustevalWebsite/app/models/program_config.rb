class ProgramConfig < ActiveRecord::Base
	belongs_to :repository
	belongs_to :program
	belongs_to :program_config
	belongs_to :run_result_format
	has_many :program_parameters

	def to_param
		"#{name}".split('/')[-1]
	end

  def self.all(session, *args)
	if session
		return self.find(:all, :conditions => ["repository_id = ?",Repository.find_by_basePath(session[:repository_id]).id])
	else
		return super.all
	end
  end
end
