class ProgramParameter < ActiveRecord::Base
	belongs_to :repository
	belongs_to :program_parameter_type
	belongs_to :program_config
  # attr_accessible :title, :body

  def self.all(session = nil, *args)
	if session
		return self.where("repository_id = ?",Repository.find(session))
	else
		return super()
	end
  end
end
