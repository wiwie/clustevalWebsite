class ProgramConfigsController < ApplicationController

	def index
		@programConfigs = ProgramConfig.all(params[:repository]).select{ |program_config| program_config.program_config_id == nil }
		
		respond_to do |format|
			format.html # index.html.erb
			format.json { render :json => @programConfigs }
		end
	end

	def fetch_table_data
		@programConfig = ProgramConfig.find(params[:id])
		@program = @programConfig.program
		@runResultFormat = RunResultFormat.find(@programConfig.run_result_format_id)
		@parameters = @programConfig.program_parameters
    	@runResults = RunResultsParameterOptimization.select(:id).where(:program_config_id => ProgramConfig.select(:id).where(:program_config_id => params[:id]))
    	@runResultsParamSets = RunResultsParameterOptimizationsParameterSet.select(:id).where(:run_results_parameter_optimization_id => @runResults)
		#@programConfigOrigId = ProgramConfig.where(:program_config_id => @programConfig.id)

		# 07/05/2015: new to improve performance
		columns = ['t12_r5','t10_r6','t0_r3','t5_r2','t4_r4','t1_r2']
		columnFormat = ['like','like','like','like','range','']

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

		@runResultsProgramConfigsRanking = RunResultsProgramConfigsRanking
			.where(:t10_r0 => params[:id])
			.order(columns[params[:iSortCol_0].to_i] + " " + params[:sSortDir_0])
			.limit(params[:iDisplayLength].to_i)
			.offset(params[:iDisplayStart].to_i)
			.where(filterString)

		# TODO: remove
		#@runResultsProgramConfigsRanking = RunResultsProgramConfigsRanking.where(:t9_r4 => @programConfigOrigId)


		@paramValuesQualityArray = []
		@runResultsProgramConfigsRanking.each do |runResult|
			@paramValuesQualityArray << [
				runResult.t12_r5, 
				runResult.t10_r6.split('/')[-1], 
				runResult.t0_r3.gsub(',','<br />'),
				#ClusteringQualityMeasure.find_by_name(runResult.t5_r2).alias,
				runResult.t5_r2,
        		runResult.t4_r4, 
				#''#view_context.link_to("Clustering", :controller => "run_results_parameter_optimizations_parameter_set_iterations", :action=>"show", :id => runResult.t1_r2).to_s
				# improves speed
				'<a href="/' + params[:repository] + '/run_results_parameter_optimizations_parameter_set_iterations/' + runResult.t1_r2.to_s + '">Clustering</a>'
			]
		end

		#@json = {"aaData" => @paramValuesQualityArray}.to_json
		@json = {"iTotalRecords" => RunResultsProgramConfigsRanking.where(:t10_r0 => params[:id]).count,
 				"iTotalDisplayRecords" => RunResultsProgramConfigsRanking.where(:t10_r0 => params[:id]).where(filterString).count, 
 				"aaData" => @paramValuesQualityArray}.to_json
		render :inline => @json
	end
	
	def show
		@programConfig = ProgramConfig.find(params[:id])
		@program = @programConfig.program
		@runResultFormat = RunResultFormat.find(@programConfig.run_result_format_id)
		@parameters = @programConfig.program_parameters
    	
		file = File.open(@programConfig.abs_path)
		@contents = ""
		while tmp = file.gets do
			@contents << tmp
		end

		
		respond_to do |format|
			format.html # index.html.erb
			format.json { render :json => @programConfig }
		end
	end
end
