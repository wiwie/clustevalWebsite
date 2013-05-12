class RunRunDataAnalysesController < ApplicationController
	before_filter :require_user
	def show
		@run = Run.find_by_name(params[:id])
		@runAnalysis = RunAnalysis.find_by_run_id(@run.id)
		@runRunDataAnalysis = RunRunDataAnalysis.find_by_run_analysis_id(@runAnalysis.id)
		@runAnalysis = @runRunDataAnalysis.run_analysis
		
		@runIds = @runRunDataAnalysis.run_run_data_analysis_run_identifiers
		@runs = []
		@runIds.each do |runId|
			@runs << RunResult.find_by_uniqueRunIdentifier(runId.runIdentifier)
		end
		
		@dataConfigIds = @runRunDataAnalysis.run_run_data_analysis_data_identifiers
		@dataConfigs = []
		@dataConfigIds.each do |dataConfigId|
			@dataConfigs << RunResult.find_by_uniqueRunIdentifier(dataConfigId.dataIdentifier)
		end
		
		@statisticIds = @runAnalysis.run_analysis_statistics
		@statistics = []
		@statisticIds.each do |statisticId|
			@statistics << statisticId.statistic
		end
		
		respond_to do |format|
			format.html # index.html.erb
			format.json { render :json => @runRunDataAnalysis }
		end
	end
end
