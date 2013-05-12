class RunDataAnalysesController < ApplicationController
	before_filter :require_user


	def show
		@run = Run.find_by_name(params[:id])
		@runAnalysis = RunAnalysis.find_by_run_id(@run.id)
		@parameterOptimizationRun = RunDataAnalysis.find_by_run_analysis_id(@runAnalysis.id)
		@runAnalysis = @parameterOptimizationRun.run_analysis

		@dataConfigIds = @parameterOptimizationRun.run_data_analysis_data_configs
		@dataConfigs = []
		@dataConfigIds.each do |dataConfigId|
			@dataConfigs << dataConfigId.data_config
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
