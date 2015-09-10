class DatasetFormat < ActiveRecord::Base
	belongs_to :repository
	has_many :datasets

  def self.all(session = nil, *args)
  if session
    return self.where("repository_id = ?",Repository.find(session))
  else
    return super()
  end
  end

  def name
  	@alias = self.alias
  	if @alias
  		return @alias
  	else
  		return super
  	end
  end
end
