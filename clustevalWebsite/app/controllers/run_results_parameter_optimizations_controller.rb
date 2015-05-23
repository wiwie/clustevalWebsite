class RunResultsParameterOptimizationsController < ApplicationController
	
	def show
		@runResult = RunResult.includes(
			
				{:run => :run_type}
			).find_by_id(params[:id])
		@runResultExecution = RunResultsExecution.find_by_run_result_id(@runResult.id)

		@run = @runResult.run
		@runExecution = RunExecution.find_by_run_id(@run.id)	
		@run = RunParameterOptimization.find_by_run_execution_id(@runExecution.id)

		@runResultsQualityMeasures = RunParameterOptimizationQualityMeasure.includes(:clustering_quality_measure).where(:run_parameter_optimization_id => @run)
		#@runResultsParamOpt = RunResultsParameterOptimization.includes(
		#		:data_config, 
		#		:program_config,
		#		{:run_results_parameter_optimizations_parameter_set => 
		#				{:run_results_parameter_optimizations_parameter_set_parameters => :program_parameter}
		#		}
		#	).find(:all, :conditions => ["run_results_execution_id = ?",@runResultExecution.id])
		@runResultsParamOpt = RunResultsParameterOptimization.includes(
				:data_config, 
				:program_config,
				{:run_results_parameter_optimizations_parameter_set => 
						{:run_results_parameter_optimizations_parameter_set_parameters => :program_parameter}
				}
			).where(:run_results_execution_id => @runResultExecution.id)

		@dataConfigs = []
		@programConfigs = []

		# log file
		logPath = @runResult.abs_path + '/logs/' + @runResult.abs_path.split('/')[-1] + '.log'
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
			@optParam = @optParams.where(:program_config_id => @programConfig.id)
			@paramNamesTmp = []
			for param in @optParam do
				@paramNamesTmp << param.program_parameter
			end
			@parameterNames << @paramNamesTmp

			if @dataConfig.goldstandard_config_id
				invocationLine = @programConfig.invocation_format_parameter_optimization
				if invocationLine == ''
					invocationLine = @programConfig.invocation_format
				end
				invocationLine = invocationLine.gsub('%gs%',@dataConfig.goldstandard_config.goldstandard.abs_path)
			else
				invocationLine = @programConfig.invocation_format_parameter_optimizationWithoutGoldStandard
				if invocationLine == ''
					invocationLine = @programConfig.invocation_formatWithoutGoldStandard
				end
				invocationLine = invocationLine.gsub('%gs%','')
			end

			invocationLine = invocationLine.gsub('%e%',@programConfig.program.abs_path)
			invocationLine = invocationLine.gsub('%i%',@dataConfig.dataset_config.dataset.abs_path)
			invocationLine = invocationLine.gsub('%o%','<OUTPUT_PATH>')

			@invocationLines << invocationLine
		end
		
		respond_to do |format|
			format.html # index.html.erb
			format.json { render :json => @runResultsParamOpt }
		end
	end

	def fetch_table_data		
		columns = ['iteration', 'param_set_as_string', 'alias', 'quality', '']
		columnFormat = ['like','like','like','range','']

		filterStrings = []
		for i in 0..columns.count-1
			format = columnFormat[i]
			if format == 'like'
				if params["sSearch_" + i.to_s] != ''
					filterStrings += [columns[i] + ' LIKE \'%' + params["sSearch_" + i.to_s] + '%\'']
				end
			elsif format == 'range'
				if params["sSearch_" + i.to_s] != '' and params["sSearch_" + i.to_s] != '~'
					split = params["sSearch_" + i.to_s].split('~')
					filterStrings += [columns[i] + ' BETWEEN ' + split[0] + ' AND ' + split[1]]
				end
			end
		end
		filterString = filterStrings.join(' AND ')


		@runResultsParamOptIteration = ParameterOptimizationIteration
				.joins([:data_config, :program_config, :clustering_quality_measure])
				.where(:data_config_id => params[:dataId])
				.where(:program_config_id => params[:programId])
				.select("value, quality, run_results_parameter_optimizations_parameter_set_iteration_id as iteration_id, iteration,param_set_as_string,clustering_quality_measures.alias")
				.group("iteration_id","clustering_quality_measures.alias")
				.order(columns[params[:iSortCol_0].to_i] + " " + params[:sSortDir_0]).limit(
			params[:iDisplayLength].to_i).offset(
			params[:iDisplayStart].to_i).where(filterString)


		@paramValuesQualityArray = []
		@runResultsParamOptIteration.each do |iteration|
			@paramValuesQualityArray << [
				iteration.iteration.to_s, 
				iteration.param_set_as_string.gsub(',','<br />'), 
				#iteration.param_set_as_string,
				iteration.alias, 
				iteration.quality.to_s,
				'<a href="/' + params[:repository] + '/run_results_parameter_optimizations_parameter_set_iterations/' + iteration.iteration_id.to_s + '" tooltip_info="/' + params[:repository] + '/run_results_parameter_optimizations_parameter_set_iterations/' + iteration.iteration_id.to_s + '/tooltip_info">Clustering</a>'
			]
		end

		@json = {"iTotalRecords" => ParameterOptimizationIteration
				.joins([:data_config, :program_config, :clustering_quality_measure])
				.where(:data_config_id => params[:dataId])
				.where(:program_config_id => params[:programId])
				.select("distinct run_results_parameter_optimizations_parameter_set_iteration_id,clustering_quality_measures.alias").count,
 				"iTotalDisplayRecords" => ParameterOptimizationIteration
				.joins([:data_config, :program_config, :clustering_quality_measure])
				.where(:data_config_id => params[:dataId])
				.where(:program_config_id => params[:programId])
				.select("distinct run_results_parameter_optimizations_parameter_set_iteration_id,clustering_quality_measures.alias")
				.where(filterString).count, 
 				"aaData" => @paramValuesQualityArray}.to_json
		render :inline => @json
	end

	def fetch_graph_data
		@runResultsParamOptIteration = ParameterOptimizationIteration.joins([:data_config, :program_config, :clustering_quality_measure]).where(:data_config_id => params[:dataId]).where(:program_config_id => params[:programId]).where(:paramName => params[:paramName]).select("GROUP_CONCAT(value SEPARATOR '\t') as value, quality, iteration,clustering_quality_measures.alias").group("iteration","clustering_quality_measures.alias")
		
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
		
		send_file( @runResultsParamOpt.abs_path + ".svg",
                :disposition => 'inline',
                :type => 'image/svg+xml',
                :stream => false,
                :filename => 'image.svg' )
	end
end
