class DataConfigsController < ApplicationController

	def index
		@dataConfigs = DataConfig.where(:repository_id => params[:repository])
		
		respond_to do |format|
			format.html # index.html.erb
			format.json { render :json => @dataConfigs }
		end
	end

	def fetch_table_data
		@dataConfig = DataConfig.find(params[:id])
		#@datasetConfig = @dataConfig.dataset_config
		#@goldstandardConfig = @dataConfig.goldstandard_config
    	#@runResults = RunResultsParameterOptimization.select(:id).where(:data_config_id => DataConfig.select(:id).where(:data_config_id => params[:id]))
    	#@runResultsParamSets = RunResultsParameterOptimizationsParameterSet.select(:id).where(:run_results_parameter_optimization_id => @runResults)
		#@dataConfigOrigId = DataConfig.where(:data_config_id => @dataConfig.id)

		columns = ['t10_r6','t0_r3','t5_r2','t4_r4','t1_r2']
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

		@runResultsDataConfigsRanking = RunResultsDataConfigsRanking
			.where(:t13_r0 => @dataConfig)
			.where('t5_r2 is not null')
			.order(columns[params[:iSortCol_0].to_i] + " " + params[:sSortDir_0])
			.limit(params[:iDisplayLength].to_i).offset(
			params[:iDisplayStart].to_i).where(filterString)

		@paramValuesQualityArray = []
		@runResultsDataConfigsRanking.each do |runResult|
			#@measure = ClusteringQualityMeasure.find_by_name(runResult.t5_r2)
			@paramValuesQualityArray << [
				runResult.t10_r6.split('/')[-1], 
				runResult.t0_r3.gsub(',','<br />'),
				#(@measure.nil? ? '' : @measure.alias),
				runResult.t5_r2,
        		runResult.t4_r4, 
				#''#view_context.link_to("Clustering", :controller => "run_results_parameter_optimizations_parameter_set_iterations", :action=>"show", :id => runResult.t1_r2).to_s
				# improves speed
				'<a href="/' + params[:repository] + '/run_results_parameter_optimizations_parameter_set_iterations/' + runResult.t1_r2.to_s + '">Clustering</a>'
			]
		end

		@json = {"iTotalRecords" => RunResultsDataConfigsRanking
					.where(:t13_r0 => @dataConfig)
					.where('t5_r2 is not null').count,
 				"iTotalDisplayRecords" => RunResultsDataConfigsRanking
 					.where(:t13_r0 => @dataConfig)
 					.where(filterString)
 					.where('t5_r2 is not null').count, 
 				"aaData" => @paramValuesQualityArray}.to_json
		render :inline => @json
	end
	
	def show
		@dataConfig = DataConfig.find(params[:id])
		@datasetConfig = @dataConfig.dataset_config
		@goldstandardConfig = @dataConfig.goldstandard_config
    	@runResults = RunResultsParameterOptimization.select(:id).where(:data_config_id => DataConfig.select(:id).where(:data_config_id => params[:id]))
    	@runResultsParamSets = RunResultsParameterOptimizationsParameterSet.select(:id).where(:run_results_parameter_optimization_id => @runResults)
		@dataConfigOrigId = DataConfig.where(:data_config_id => @dataConfig.id)

		file = File.open(@dataConfig.abs_path)
		@contents = ""
		while tmp = file.gets do
			@contents << tmp
		end

		
		respond_to do |format|
			format.html # index.html.erb
			format.json { render :json => @dataConfig }
		end
	end

	def comparison
            @data_config_id = DataConfig.find(params[:id]).data_config.id
	end
end
