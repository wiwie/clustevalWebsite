class RunInternalParameterOptimizationsController < ApplicationController
	before_filter :require_user
	def show
		@parameterOptimizationRun = RunInternalParameterOptimization.find_by_id(params[:id])
		@run = Run.find_by_id(RunExecution.find_by_id(@parameterOptimizationRun.runExecutionId).runId)
		@dataConfigIds = RunExecutionDataConfig.find(:all, :conditions => ["runExecutionId = ?",@parameterOptimizationRun.runExecutionId])
		@dataConfigs = []
		@dataConfigIds.each do |dataConfigId|
			@dataConfigs << DataConfig.find_by_id(dataConfigId.dataConfigId)
		end
		
		# store parameter values
		@params = []
		@values = []
		
		@programConfigIds = RunExecutionProgramConfig.find(:all, :conditions => ["runExecutionId = ?",@parameterOptimizationRun.runExecutionId])
		@programConfigs = []
		@programConfigIds.each do |programConfigId|
			@programConfigs << ProgramConfig.find_by_id(programConfigId.programConfigId)
		
			# parameter values
			@paramValuesIds = RunExecutionParameterValue.find(:all, :conditions => ["runExecutionId = ? and programConfigId = ?",@parameterOptimizationRun.runExecutionId,programConfigId.programConfigId])
			@paramValuesIds.each do |paramValueId|
				@params << ProgramParameter.find_by_id(paramValueId.parameterId)
				@values << paramValueId.value
			end
		end
		
		@qualityMeasures = []
		@qualityMeasureIds = RunExecutionQualityMeasure.find(:all, :conditions => ["runExecutionId = ?",@parameterOptimizationRun.runExecutionId])
		@qualityMeasureIds.each do |qualityMeasureId|
			@qualityMeasures << ClusteringQualityMeasure.find_by_id(qualityMeasureId.qualityMeasureId)
		end
		
		respond_to do |format|
			format.html # index.html.erb
			format.json { render :json => @parameterOptimizationRun }
		end
	end
end
