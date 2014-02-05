class StatisticsController < ApplicationController


	def show
		@statistic = Statistic.find(params[:id])
	end

	def index
		@dataStatistics = StatisticsData.all(params[:repository]).sort_by{|x| x.statistic.alias}
		@runStatistics = StatisticsRun.all(params[:repository]).sort_by{|x| x.statistic.alias}
		@runDataStatistics = StatisticsRunData.all(params[:repository]).sort_by{|x| x.statistic.alias}
	end
end
