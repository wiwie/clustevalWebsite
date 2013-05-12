class RunResultsRunDataAnalysesController < ApplicationController
	before_filter :require_user

	def show
		@runResult = RunResult.find_by_id(params[:id])

		@run = Run.find(@runResult.run_id)
		@runAnalysis = RunAnalysis.find_by_run_id(@run.id)
		@runRunAnalysis = RunRunAnalysis.find_by_runs_analysis_id(@runAnalysis.id)
		@runRunDataAnalysis = RunRunDataAnalysis.find_by_runs_run_analysis_id(@runRunAnalysis.id)

		@runRunAnalysisRunIdentifier = RunRunAnalysisRunIdentifier.where(:runs_run_analysis_id => @runRunAnalysis.id)
		@runRunAnalysisDataIdentifier = RunRunDataAnalysisDataIdentifier.where(:runs_run_data_analysis_id => @runRunDataAnalysis.id)
		@runsAnalysisStatistic = RunAnalysisStatistic.where(:runs_analysis_id => @runAnalysis.id)

		@statistics = []

		@runsAnalysisStatistic.each do |st|
			@statistics << Statistic.find(st.statistic_id)
		end

		@contents = []

		@code = []

		for d in 0..@runRunAnalysisRunIdentifier.length-1
			 runIdentifier = @runRunAnalysisRunIdentifier[d]

			@codeTmp = []
			@contentsTmp = []

			 for e in 0..@runRunAnalysisDataIdentifier.length-1
			 	dataIdentifier = @runRunAnalysisDataIdentifier[e]

				@codeTmpTmp = []
				@contentsTmpTmp = []

				@basePath = @runResult.absPath + '/analyses/' + runIdentifier.runIdentifier + '_' + dataIdentifier.dataIdentifier + '_'

				for i in 0..@statistics.length-1
					statistic = @statistics[i]

					@path = @basePath + statistic.name + ".txt"

					file = File.open(@path)

					if statistic.name == 'IntraInterDistributionDataStatistic' or statistic.name == 'SimilarityDistributionDataStatistic' or statistic.name == 'NodeDegreeDistributionDataStatistic'
		      		else
						@content = ""
						while tmp = file.gets do
							@content << tmp
						end
						@contentsTmpTmp << @content
		      			@newCode = @content
		      		end

	      			@codeTmpTmp << @newCode
					
				end

				@codeTmp << @codeTmpTmp
				@contentsTmp << @contentsTmpTmp
			end

			@code << @codeTmp
			@contents << @contentsTmp
		end
	end
end
