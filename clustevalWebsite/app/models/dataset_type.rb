class DatasetType < ActiveRecord::Base
  attr_accessible :name, :description

  def self.all(session = nil, *args)
	if session
		return self.where("repository_id = ?",Repository.find(session))
	else
		return super()
	end
  end

end
