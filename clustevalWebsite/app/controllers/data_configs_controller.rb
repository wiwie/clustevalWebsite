class DataConfigsController < ApplicationController

	def index
		@repositoryType = RepositoryType.find_by_name("Repository")
		@repository = Repository.find_by_repository_type_id(@repositoryType.id)
		@dataConfigs = DataConfig.where(:repository_id => @repository.id)
		
		respond_to do |format|
			format.html # index.html.erb
			format.json { render :json => @dataConfigs }
		end
	end

	def fetch_table_data
		@dataConfig = DataConfig.find(params[:id])
		@datasetConfig = @dataConfig.dataset_config
		@goldstandardConfig = @dataConfig.goldstandard_config
    	@runResults = RunResultsParameterOptimization.select(:id).where(:data_config_id => DataConfig.select(:id).where(:data_config_id => params[:id]))
    	@runResultsParamSets = RunResultsParameterOptimizationsParameterSet.select(:id).where(:run_results_parameter_optimization_id => @runResults)
		@dataConfigOrigId = DataConfig.where(:data_config_id => @dataConfig.id)
		@runResultsDataConfigsRanking = RunResultsDataConfigsRanking.where(:t9_r3 => @dataConfigOrigId)

		@paramValuesQualityArray = []
		@runResultsDataConfigsRanking.each do |runResult|
			#@measure = ClusteringQualityMeasure.find_by_name(runResult.t5_r2)
			@paramValuesQualityArray << [
				runResult.t12_r5, 
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

		@json = {"aaData" => @paramValuesQualityArray}.to_json
		render :inline => @json
	end
	
	def show
		@dataConfig = DataConfig.find(params[:id])
		@datasetConfig = @dataConfig.dataset_config
		@goldstandardConfig = @dataConfig.goldstandard_config
    	@runResults = RunResultsParameterOptimization.select(:id).where(:data_config_id => DataConfig.select(:id).where(:data_config_id => params[:id]))
    	@runResultsParamSets = RunResultsParameterOptimizationsParameterSet.select(:id).where(:run_results_parameter_optimization_id => @runResults)
		@dataConfigOrigId = DataConfig.where(:data_config_id => @dataConfig.id)

		file = File.open(@dataConfig.absPath)
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
            #@data_config_id = DataConfig.all(params[:repository]).select{|dataConfig| dataConfig.id == params[:id] and not dataConfig.data_config_id}.first
            @data_config_id = params[:id]
	end
end
