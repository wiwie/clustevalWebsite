class StatisticsData < ActiveRecord::Base
	belongs_to :repository
	belongs_to :statistic

  def self.all(session = nil, *args)
	if session
		return self.where("repository_id = ?",Repository.find(session))
	else
		return super()
	end
  end
end
