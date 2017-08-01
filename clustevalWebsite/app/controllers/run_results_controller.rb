class RunResultsController < ApplicationController

	def index
		@oldRunResults = RunResult.all(params[:repository])
		@runResults = []
		@castedRunResults = []
		@oldRunResults.each do |runResult|
			@runType = runResult.run_type
			if @runType.name == 'Clustering'
				@runResultExecution = RunResultsExecution.find_by_run_result_id(runResult.id)
				@castedRunResults << RunResultsClustering.find_by_run_results_execution_id(@runResultExecution.id)
				@runResults << runResult
			elsif @runType.name == 'Parameter Optimization'
				@runResultExecution = RunResultsExecution.find_by_run_result_id(runResult.id)
				#@tmp = RunResultsParameterOptimization.find(:all, :conditions => ["runResultExecutionId = ?",@runResultExecution.id])
				#@tmp.each do |tmp2|
				#	@castedRunResults << tmp2
			#		@runResults << runResult
				#end
				@castedRunResults << RunResultsParameterOptimization.find_by_run_results_execution_id(@runResultExecution.id)
				@runResults << runResult
			elsif @runType.name == 'Internal Parameter Optimization'
				@runResultExecution = RunResultsExecution.find_by_run_result_id(runResult.id)
				@castedRunResults << RunResultsInternalParameterOptimization.find_by_run_results_execution_id(@runResultExecution.id)
				@runResults << runResult
			elsif @runType.name == 'Data Analysis'
				@runResultAnalysis = RunResultsAnalysis.find_by_run_result_id(runResult.id)
				@castedRunResults << RunResultsDataAnalysis.find_by_run_results_analysis_id(@runResultAnalysis.id)
				@runResults << runResult
			elsif @runType.name == 'Run Analysis'
				@runResultAnalysis = RunResultsAnalysis.find_by_run_result_id(runResult.id)
				@castedRunResults << RunResultsRunAnalysis.find_by_run_results_analysis_id(@runResultAnalysis.id)
				@runResults << runResult
			elsif @runType.name == 'Run-Data Analysis'
				@runResultAnalysis = RunResultsAnalysis.find_by_run_result_id(runResult.id)
				@castedRunResults << RunResultsRunDataAnalysis.find_by_run_results_analysis_id(@runResultAnalysis.id)
				@runResults << runResult
			end
		end
		
		respond_to do |format|
			format.html # index.html.erb
			format.json { render :json => @runResults }
		end
	end

	def find_by_name
		puts params[:name]
		runResult = RunResult.all(params[:repository]).where(:unique_run_identifier => params[:name]).first

		@runType = runResult.run_type
		if @runType.name == 'Clustering'
			@runResultExecution = RunResultsExecution.find_by_run_result_id(runResult.id)
			redirect_to RunResultsClustering.find_by_run_results_execution_id(@runResultExecution.id)
		elsif @runType.name == 'Parameter Optimization'
			@runResultExecution = RunResultsExecution.find_by_run_result_id(runResult.id)
			redirect_to RunResultsParameterOptimization.find_by_run_results_execution_id(@runResultExecution.id)
		elsif @runType.name == 'Internal Parameter Optimization'
			@runResultExecution = RunResultsExecution.find_by_run_result_id(runResult.id)
			redirect_to RunResultsInternalParameterOptimization.find_by_run_results_execution_id(@runResultExecution.id)
		elsif @runType.name == 'Data Analysis'
			@runResultAnalysis = RunResultsAnalysis.find_by_run_result_id(runResult.id)
			redirect_to RunResultsDataAnalysis.find_by_run_results_analysis_id(@runResultAnalysis.id)
		elsif @runType.name == 'Run Analysis'
			@runResultAnalysis = RunResultsAnalysis.find_by_run_result_id(runResult.id)
			redirect_to RunResultsRunAnalysis.find_by_run_results_analysis_id(@runResultAnalysis.id)
		elsif @runType.name == 'Run-Data Analysis'
			@runResultAnalysis = RunResultsAnalysis.find_by_run_result_id(runResult.id)
			redirect_to RunResultsRunDataAnalysis.find_by_run_results_analysis_id(@runResultAnalysis.id)
		end
	end
end
