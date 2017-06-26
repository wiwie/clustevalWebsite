class RunRunAnalysesController < ApplicationController
	

	def show
		@run = Run.find(params[:id])
		@runAnalysis = RunAnalysis.find_by_run_id(@run.id)
		@parameterOptimizationRun = RunRunAnalysis.find_by_run_analysis_id(@runAnalysis.id)
		@runAnalysis = @parameterOptimizationRun.run_analysis
		
		@runIds = @parameterOptimizationRun.run_run_analysis_run_identifiers
		@runResults = []
		@runIds.each do |runId|
			@runResults << RunResult.find_by_unique_run_identifier(runId.runIdentifier)
		end
		
		@statisticIds = @runAnalysis.run_analysis_statistics
		@statistics = []
		@statisticIds.each do |statisticId|
			@statistics << statisticId.statistic
		end
		
		respond_to do |format|
			format.html # index.html.erb
			format.json { render :json => @parameterOptimizationRun }
		end
	end
end
