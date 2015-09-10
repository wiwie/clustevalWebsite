class RunResult < ActiveRecord::Base
	belongs_to :repository
	belongs_to :run_type
	belongs_to :run

	def to_param
		"#{id}"
	end

  def self.all(session = nil, *args)
	if session
		return self.where("repository_id = ?",Repository.find(session))
	else
		return super()
	end
  end
end
