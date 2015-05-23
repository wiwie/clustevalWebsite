class Goldstandard < ActiveRecord::Base
	belongs_to :repository
	belongs_to :goldstandard

  def self.all(session, *args)
	if session
		return self.find(:all, :conditions => ["repository_id = ?",Repository.find(session)])
	else
		return super.all
	end
  end

  def name
  	return (abs_path.split('/')[-2] + '/' + abs_path.split('/')[-1])
  end
end
