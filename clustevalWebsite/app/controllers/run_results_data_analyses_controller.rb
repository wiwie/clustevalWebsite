class RunResultsDataAnalysesController < ApplicationController
	before_filter :require_user
	
	def show
		@statistics = []

		@runResult = RunResult.find_by_id(params[:id])
		
		@run = Run.find(@runResult.run_id)
		@runAnalysis = RunAnalysis.find_by_run_id(@run.id)
		@runDataAnalysis = RunDataAnalysis.find_by_run_analysis_id(@runAnalysis.id)

		@runDataAnalysisDataConfigs = RunDataAnalysisDataConfig.where(:run_data_analysis_id => @runDataAnalysis.id)

		for d in 0..@runDataAnalysisDataConfigs.length-1
			 dataConfig = @runDataAnalysisDataConfigs[d]

			@statistics << RunResultDataAnalysisDataConfigsStatistic.where(:run_result_id => params[:id]).where(:data_config_id => dataConfig.data_config_id)
		end
	end
end
