class RunResultsParameterOptimizationsController < ApplicationController
	before_filter :require_user
	def show
		@runResult = RunResult.includes(
			
				{:run => :run_type}
			).find_by_id(params[:id])
		@runResultExecution = RunResultsExecution.find_by_run_result_id(@runResult.id)

		@run = @runResult.run
		@runExecution = RunExecution.find_by_run_id(@run.id)	
		@run = RunParameterOptimization.find_by_run_execution_id(@runExecution.id)

		@runResultsQualityMeasures = RunParameterOptimizationQualityMeasure.includes(:clustering_quality_measure).where(:run_parameter_optimization_id => @run)
		@runResultsParamOpt = RunResultsParameterOptimization.includes(
				:data_config, 
				:program_config,
				{:run_results_parameter_optimizations_parameter_set => 
						{:run_results_parameter_optimizations_parameter_set_parameters => :program_parameter}
				}
			).find(:all, :conditions => ["run_results_execution_id = ?",@runResultExecution.id])

		@dataConfigs = []
		@programConfigs = []

		# log file
		logPath = @runResult.absPath + '/logs/' + @runResult.absPath.split('/')[-1] + '.log'
		file = File.open(logPath)
		@logContents = ""
		while tmp = file.gets do
			@logContents << tmp
		end
		
		@runResultsParamSetIterationIds = []
  		@qualityMeasures = []
  		@parameterNames = []
  		@paramValuesQualityStrings = []
  		@paramValuesTableStrings = []

  		@optParams = @run.run_parameter_optimization_parameters

		@invocationLines = []

		for i in 0..@runResultsParamOpt.length-1 do
			runResultsParam = @runResultsParamOpt[i]
			@dataConfig = runResultsParam.data_config
			@dataConfigs << @dataConfig
			@programConfig = runResultsParam.program_config
			@programConfigs << @programConfig
			@optParam = @optParams.find_by_program_config_id(@programConfig.id)
			@parameterNames << @optParam.program_parameter.name

			if @dataConfig.goldstandard_config_id
				invocationLine = @programConfig.invocationFormatParameterOptimization
				if invocationLine == ''
					invocationLine = @programConfig.invocationFormat
				end
				invocationLine = invocationLine.gsub('%gs%',@dataConfig.goldstandard_config.goldstandard.absPath)
			else
				invocationLine = @programConfig.invocationFormatParameterOptimizationWithoutGoldStandard
				if invocationLine == ''
					invocationLine = @programConfig.invocationFormatWithoutGoldStandard
				end
				invocationLine = invocationLine.gsub('%gs%','')
			end

			invocationLine = invocationLine.gsub('%e%',@programConfig.program.absPath)
			invocationLine = invocationLine.gsub('%i%',@dataConfig.dataset_config.dataset.absPath)
			invocationLine = invocationLine.gsub('%o%','<OUTPUT_PATH>')

			@invocationLines << invocationLine
		end
		
		respond_to do |format|
			format.html # index.html.erb
			format.json { render :json => @runResultsParamOpt }
		end
	end

	def fetch_table_data
		@runResultsParamOptIteration = ParameterOptimizationIteration.joins([:data_config, :program_config, :clustering_quality_measure]).where(:data_config_id => params[:dataId]).where(:program_config_id => params[:programId]).select("value, quality, run_results_parameter_optimizations_parameter_set_iteration_id as iteration_id, iteration,paramSetAsString,clustering_quality_measures.alias")
		
		@paramValuesQualityArray = []
		@runResultsParamOptIteration.each do |iteration|
			@paramValuesQualityArray << [
				iteration.iteration.to_s, 
				iteration.paramSetAsString.gsub(',','<br />'), 
				#iteration.paramSetAsString,
				iteration.alias, 
				iteration.quality.to_s,
				'<a href="/run_results_parameter_optimizations_parameter_set_iterations/' + iteration.iteration_id.to_s + '">Clustering</a>'
			]
		end

		@json = {"aaData" => @paramValuesQualityArray}.to_json
		render :inline => @json
	end

	def fetch_graph_data
		@runResultsParamOptIteration = ParameterOptimizationIteration.joins([:data_config, :program_config, :clustering_quality_measure]).where(:data_config_id => params[:dataId]).where(:program_config_id => params[:programId]).select("value, quality, iteration,clustering_quality_measures.alias")
		
		@paramValuesQualityString = ''
		@runResultsParamOptIteration.each do |iteration|
			@paramValuesQualityString << iteration.alias
			@paramValuesQualityString << '	'
			@paramValuesQualityString << iteration.value.to_s
			@paramValuesQualityString << '	'
			@paramValuesQualityString << iteration.quality.to_s
			@paramValuesQualityString << '	'
			@paramValuesQualityString << iteration.iteration.to_s
			@paramValuesQualityString << '
'
		end
		@paramValuesQualityString = @paramValuesQualityString.chop

		render :inline => @paramValuesQualityString
	end
	
	def img
		@runResultsParamOpt = RunResultsParameterOptimization.find_by_id(params[:id])
		
		send_file( @runResultsParamOpt.absPath + ".svg",
                :disposition => 'inline',
                :type => 'image/svg+xml',
                :stream => false,
                :filename => 'image.svg' )
	end
end
