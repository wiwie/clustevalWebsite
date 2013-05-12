class RunClusteringsController < ApplicationController
	before_filter :require_user

	def show
		@run = Run.find_by_name(params[:id])
		@executionRun = RunExecution.find_by_run_id(@run.id)
		@clusteringRun = RunClustering.find_by_run_execution_id(@executionRun.id)
		
		@dataConfigIds = @executionRun.run_execution_data_configs
		@dataConfigs = []
		@dataConfigIds.each do |dataConfigId|
			@dataConfigs << dataConfigId.data_config
		end
				
		# store parameter values
		@params = []
		@values = []
		
		@programConfigIds = @executionRun.run_execution_program_configs
		@programConfigs = []
		@programConfigIds.each do |programConfigId|
			@programConfigs << programConfigId.program_config
		
			# parameter values
			@paramValuesIds = @executionRun.run_execution_parameter_values
			@paramValuesIds.each do |paramValueId|
				@params << paramValueId.program_parameter
				@values << paramValueId.value
			end
		end
		
		@qualityMeasures = []
		@qualityMeasureIds = @executionRun.run_execution_quality_measures
		@qualityMeasureIds.each do |qualityMeasureId|
			@qualityMeasures << qualityMeasureId.clustering_quality_measure
		end
		
		respond_to do |format|
			format.html # index.html.erb
			format.json { render :json => @clusteringRun }
		end
	end
end
