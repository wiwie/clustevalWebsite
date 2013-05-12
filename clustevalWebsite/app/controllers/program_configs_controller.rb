class ProgramConfigsController < ApplicationController
	before_filter :require_user

	def index
		@programConfigs = ProgramConfig.all(session)
		
		respond_to do |format|
			format.html # index.html.erb
			format.json { render :json => @programConfigs }
		end
	end

	def fetch_table_data
		@programConfig = ProgramConfig.find_by_name(params[:id])
		@program = @programConfig.program
		@runResultFormat = RunResultFormat.find(@programConfig.run_result_format_id)
		@parameters = @programConfig.program_parameters
    	@runResults = RunResultsParameterOptimization.select(:id).where(:program_config_id => ProgramConfig.select(:id).where(:program_config_id => params[:id]))
    	@runResultsParamSets = RunResultsParameterOptimizationsParameterSet.select(:id).where(:run_results_parameter_optimization_id => @runResults)
		@programConfigOrigId = ProgramConfig.where(:program_config_id => @programConfig.id)
		@runResultsProgramConfigsRanking = RunResultsProgramConfigsRanking.where(:t9_r4 => @programConfigOrigId)


		@paramValuesQualityArray = []
		@runResultsProgramConfigsRanking.each do |runResult|
			@paramValuesQualityArray << [
				runResult.t12_r5, 
				runResult.t10_r6.split('/')[-1], 
				runResult.t0_r3.gsub(',','<br />'),
				ClusteringQualityMeasure.find_by_name(runResult.t5_r2).alias,
        		runResult.t4_r4, 
				#''#view_context.link_to("Clustering", :controller => "run_results_parameter_optimizations_parameter_set_iterations", :action=>"show", :id => runResult.t1_r2).to_s
				# improves speed
				'<a href="/run_results_parameter_optimizations_parameter_set_iterations/' + runResult.t1_r2.to_s + '">Clustering</a>'
			]
		end

		@json = {"aaData" => @paramValuesQualityArray}.to_json
		render :inline => @json
	end
	
	def show
		@programConfig = ProgramConfig.find_by_name(params[:id])
		@program = @programConfig.program
		@runResultFormat = RunResultFormat.find(@programConfig.run_result_format_id)
		@parameters = @programConfig.program_parameters
    	@runResults = RunResultsParameterOptimization.select(:id).where(:program_config_id => ProgramConfig.select(:id).where(:program_config_id => params[:id]))
    	@runResultsParamSets = RunResultsParameterOptimizationsParameterSet.select(:id).where(:run_results_parameter_optimization_id => @runResults)
		@programConfigOrigId = ProgramConfig.where(:program_config_id => @programConfig.id)
		@runResultsProgramConfigsRanking = RunResultsProgramConfigsRanking.where(:t9_r4 => @programConfigOrigId)

		file = File.open(@programConfig.absPath)
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
