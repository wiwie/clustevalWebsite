class ProgramConfig < ActiveRecord::Base
	belongs_to :repository
	belongs_to :program
	belongs_to :program_config
	belongs_to :run_result_format
	has_many :program_parameters

	#def to_param
	#	"#{name}".split('/')[-1]
	#end

  def self.all(session = nil, *args)
	if session
		return self.where("repository_id = ?",Repository.find(session))
	else
		return super()
	end
  end
end
