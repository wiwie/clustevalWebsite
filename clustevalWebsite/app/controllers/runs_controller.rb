class RunsController < ApplicationController
	before_filter :require_user
	def index
		@runs = []
		@castedRun = []
		@dataConfigs = []
		@programConfigs = []
		@runsAnalysis = []
		
		Run.all(session).each do |run|
			
			if run.run_type.name == "Clustering"
				# objects for this run
				@runs << run
				@runExecution = RunExecution.find_by_run_id(run.id)
				@castedRunConfig = RunClustering.find_by_run_execution_id(@runExecution.id)
				@castedRun << @castedRunConfig
				
				# data configs
				@dataConfigIds = @runExecution.run_execution_data_configs
				@dataConfigsNew = []
				@dataConfigIds.each do |dataConfigId|
					@dataConfigsNew << dataConfigId.data_config
				end
				@dataConfigs << @dataConfigsNew
				
				# program configs
				@programConfigIds = @runExecution.run_execution_program_configs
				@programConfigsNew = []
				@programConfigIds.each do |programConfigId|
					@programConfigsNew << programConfigId.program_config
				end
				@programConfigs << @programConfigsNew
				
				# run configs
				@runsAnalysis << []
				
		
			elsif run.run_type.name == "Parameter Optimization"
				@runs << run
				@runExecution = RunExecution.find_by_run_id(run.id)
				@castedRunConfig = RunParameterOptimization.find_by_run_execution_id(@runExecution.id)
				@castedRun << @castedRunConfig
				
				@dataConfigIds = @runExecution.run_execution_data_configs
				@dataConfigsNew = []
				@dataConfigIds.each do |dataConfigId|
					@dataConfigsNew << dataConfigId.data_config
				end
				@dataConfigs << @dataConfigsNew
				
				# store parameter values
				@params = []
				@values = []
				
				@programConfigIds = @runExecution.run_execution_program_configs
				@programConfigsNew = []
				@programConfigIds.each do |programConfigId|
					@programConfigsNew << programConfigId.program_config
					
					# parameter values
					@paramValuesIds = @runExecution.run_execution_parameter_values
					@paramValuesIds.each do |paramValueId|
						@params << @paramValuesIds.program_parameter
						@values << @paramValuesIds.value
					end
				end
				@programConfigs << @programConfigsNew
				
				@runsAnalysis << []
				
			elsif run.run_type.name == "Internal Parameter Optimization"
				@runs << run
				@runExecution = RunExecution.find_by_run_id(run.id)
				@castedRunConfig = RunInternalParameterOptimization.find_by_run_execution_id(@runExecution.id)
				@castedRun << @castedRunConfig
				
				@dataConfigIds = @runExecution.run_execution_data_configs
				@dataConfigsNew = []
				@dataConfigIds.each do |dataConfigId|
					@dataConfigsNew << dataConfigId.data_config
				end
				@dataConfigs << @dataConfigsNew
				
				# store parameter values
				@params = []
				@values = []
				
				@programConfigIds = @runExecution.run_execution_program_configs
				@programConfigsNew = []
				@programConfigIds.each do |programConfigId|
					@programConfigsNew << programConfigId.program_config
					
					# parameter values
					@paramValuesIds = @runExecution.run_execution_parameter_values
					@paramValuesIds.each do |paramValueId|
						@params << @paramValuesIds.program_parameter
						@values << @paramValuesIds.value
					end
				end
				@programConfigs << @programConfigsNew
				
				@runsAnalysis << []
				
				
			elsif run.run_type.name == "Data Analysis"
				@runs << run
				@castedRunConfig = RunDataAnalysis.find_by_run_analysis_id(RunAnalysis.find_by_run_id(run.id))
				@castedRun << @castedRunConfig
				
				@dataConfigIds = @castedRunConfig.run_data_analysis_data_configs
				@dataConfigsNew = []
				@dataConfigIds.each do |dataConfigId|
					@dataConfigsNew << dataConfigId.data_config
				end
				@dataConfigs << @dataConfigsNew
				
				@programConfigsNew = []
				@programConfigs << @programConfigsNew
				
				@runsAnalysis << []
				
			elsif run.run_type.name == "Run Analysis"
				@runs << run
				@castedRunConfig = RunRunAnalysis.find_by_run_analysis_id(RunAnalysis.find_by_run_id(run.id))
				@castedRun << @castedRunConfig
				
				@runIds = @castedRunConfig.run_run_analysis_run_identifiers
				@runsNew = []
				@runIds.each do |runId|
					@runsNew << runId.runIdentifier
				end
				@runsAnalysis << @runsNew
				
				@dataConfigs << []
				
				@programConfigsNew = []
				@programConfigs << @programConfigsNew
				
			elsif run.run_type.name == "Run-Data Analysis"
				@runs << run
				@castedRunConfig = RunRunDataAnalysis.find_by_run_analysis_id(RunAnalysis.find_by_run_id(run.id))
				@castedRun << @castedRunConfig
				
				@dataConfigIds = RunDataAnalysisDataConfig.find(:all, :conditions => ["run_data_analysis_id = ?",@castedRunConfig.id])
				@dataConfigsNew = []
				@dataConfigIds.each do |dataConfigId|
					@dataConfigsNew << DataConfig.find_by_id(dataConfigId.data_config_id)
				end
				@dataConfigs << @dataConfigsNew
				
				@programConfigsNew = []
				@programConfigs << @programConfigsNew
				
				@runsAnalysis << []
				
			end
		end
		
		respond_to do |format|
			format.html # index.html.erb
			format.json { render :json => @runs }
		end
	end
	
	def show
		run = Run.find_by_name(params[:id])
		if run.run_type.name == "Clustering"
				# objects for this run config
				@castedRunConfig = RunClustering.find_by_run_execution_id(RunExecution.find_by_run_id(run.id))
				redirect_to :controller => 'run_clusterings', :action => 'show', :id => @castedRunConfig
				
			elsif run.run_type.name == "Parameter Optimization"
				@castedRunConfig = RunParameterOptimization.find_by_run_execution_id(RunExecution.find_by_run_id(run.id))
				redirect_to :controller => 'run_parameter_optimizations', :action => 'show', :id => @castedRunConfig
			
			elsif run.run_type.name == "Internal Parameter Optimization"
				@castedRunConfig = RunInternalParameterOptimization.find_by_run_execution_id(RunExecution.find_by_run_id(run.id))
				redirect_to :controller => 'run_internal_parameter_optimizations', :action => 'show', :id => @castedRunConfig
				
			elsif run.run_type.name == "Data Analysis"
				@castedRunConfig = RunDataAnalysis.find_by_run_analysis_id(RunAnalysis.find_by_run_id(run.id))
				redirect_to :controller => 'run_data_analyses', :action => 'show', :id => @castedRunConfig
			
			elsif run.run_type.name == "Run Analysis"
				@castedRunConfig = RunRunAnalysis.find_by_run_analysis_id(RunAnalysis.find_by_run_id(run.id))
				redirect_to :controller => 'run_run_analyses', :action => 'show', :id => @castedRunConfig
			
			elsif run.run_type.name == "Run-Data Analysis"
				@castedRunConfig = RunRunDataAnalysis.find_by_run_analysis_id(RunAnalysis.find_by_run_id(run.id))
				redirect_to :controller => 'run_run_data_analyses', :action => 'show', :id => @castedRunConfig
			end
	end

	def start
		Dir.chdir('/home/wiwie/Dropbox/workspace/ClusEvalFramework')
		system('java -cp lib/*:lib/logback/*:bin serverclient.EvalClient -clientId ' + current_user.id.to_s + ' -performRun ' + params[:id].to_s)
		redirect_to :controller => "runs", :action => "show", :id => params[:id]
	end

	def stop
		Dir.chdir('/home/wiwie/Dropbox/workspace/ClusEvalFramework')
		system('java -cp lib/*:lib/logback/*:bin serverclient.EvalClient -clientId ' + current_user.id.to_s + ' -terminateRun ' + params[:id].to_s)
		redirect_to :controller => "runs", :action => "show", :id => params[:id]
	end
end
