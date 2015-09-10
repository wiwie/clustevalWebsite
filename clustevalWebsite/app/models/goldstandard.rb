class Goldstandard < ActiveRecord::Base
	belongs_to :repository
	belongs_to :goldstandard

  def self.all(session = nil, *args)
	if session
		return self.where("repository_id = ?",Repository.find(session))
	else
		return super()
	end
  end

  def name
  	return (abs_path.split('/')[-2] + '/' + abs_path.split('/')[-1])
  end
end
