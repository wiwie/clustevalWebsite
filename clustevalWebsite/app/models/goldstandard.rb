class Goldstandard < ActiveRecord::Base
	belongs_to :repository
	belongs_to :goldstandard

  def self.all(session, *args)
	if session
		return self.find(:all, :conditions => ["repository_id = ?",Repository.find_by_basePath(session[:repository_id]).id])
	else
		return super.all
	end
  end

  def name
  	return (absPath.split('/')[-2] + '/' + absPath.split('/')[-1])
  end
end
