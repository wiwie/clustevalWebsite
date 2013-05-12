class RunParameterOptimizationsController < ApplicationController
	before_filter :require_user
	def show
		@run = Run.find_by_name(params[:id])
		@executionRun = RunExecution.find_by_run_id(@run.id)
		@parameterOptimizationRun = RunParameterOptimization.find_by_run_execution_id(@executionRun.id)

		@run = @executionRun.run
		@dataConfigIds = @executionRun.run_execution_data_configs
		@dataConfigs = []
		@dataConfigIds.each do |dataConfigId|
			@dataConfigs << dataConfigId.data_config
		end
		
		# store parameter values
		@params = []
		@values = []
		@optMethods = []
		@optCriterions = []
		@optParameters = []
		
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
			
			# method
			#@methodIds = @parameterOptimizationRun.run_parameter_optimization_methods
			# should only be one -> assumption
			@optMethod = RunParameterOptimizationMethod.where(:program_config_id => programConfigId.program_config.id).where(:run_parameter_optimization_id => @parameterOptimizationRun.id).first
			@optMethods << @optMethod.parameter_optimization_method
			@optCriterions << @optMethod.clustering_quality_measure
			#@paramIds = @parameterOptimizationRun.run_parameter_optimization_parameters
			@paramIds = RunParameterOptimizationParameter.where(:program_config_id => programConfigId.program_config.id).where(:run_parameter_optimization_id => @parameterOptimizationRun.id)
			@optParamsNew = []
			@paramIds.each do |paramId|
				@optParamsNew << paramId.program_parameter
			end
			@optParameters << @optParamsNew
			
		end
		
		@qualityMeasures = []
		@qualityMeasureIds = @executionRun.run_execution_quality_measures
		@qualityMeasureIds.each do |qualityMeasureId|
			@qualityMeasures << qualityMeasureId.clustering_quality_measure
		end
		
		respond_to do |format|
			format.html # index.html.erb
			format.json { render :json => @parameterOptimizationRun }
		end
	end
end
