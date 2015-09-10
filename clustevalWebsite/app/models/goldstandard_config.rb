class GoldstandardConfig < ActiveRecord::Base
	belongs_to :repository
	belongs_to :goldstandard
	belongs_to :goldstandard_config


	def to_param
		"#{name}"
	end

  def self.all(session = nil, *args)
	if session
		return self.where("repository_id = ?",Repository.find(session))
	else
		return super()
	end
  end
end
