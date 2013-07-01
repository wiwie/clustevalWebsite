class StatisticsController < ApplicationController
	before_filter :require_user

	def show

	end

	def index
		@dataStatistics = StatisticsData.all(session).sort_by{|x| x.statistic.alias}
		@runStatistics = StatisticsRun.all(session).sort_by{|x| x.statistic.alias}
		@runDataStatistics = StatisticsRunData.all(session).sort_by{|x| x.statistic.alias}
	end
end
