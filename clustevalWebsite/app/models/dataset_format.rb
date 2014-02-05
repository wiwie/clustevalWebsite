class DatasetFormat < ActiveRecord::Base
	belongs_to :repository
	has_many :datasets

  def self.all(session, *args)
  if session
    return self.find(:all, :conditions => ["repository_id = ?",Repository.find(session)])
  else
    return super.all
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
