class RunResultsController < ApplicationController
	before_filter :require_user
	def index
		@oldRunResults = RunResult.all(session)
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
end
