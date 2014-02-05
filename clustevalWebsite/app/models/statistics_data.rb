class StatisticsData < ActiveRecord::Base
	belongs_to :repository
	belongs_to :statistic

  def self.all(session, *args)
	if session
		return self.find(:all, :conditions => ["repository_id = ?",Repository.find(session)])
	else
		return super.all
	end
  end
end
