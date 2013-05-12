class RunResultsRunAnalysesController < ApplicationController
	before_filter :require_user

	def show
		@runResult = RunResult.find_by_id(params[:id])

		@run = Run.find(@runResult.run_id)
		@runAnalysis = RunAnalysis.find_by_run_id(@run.id)
		@runRunAnalysis = RunRunAnalysis.find_by_run_analysis_id(@runAnalysis.id)

		@runRunAnalysisRunIdentifier = RunRunAnalysisRunIdentifier.where(:run_run_analysis_id => @runRunAnalysis.id)

		@runsAnalysisStatistic = RunAnalysisStatistic.where(:run_analysis_id => @runAnalysis.id)

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

			@basePath = @runResult.absPath + '/analyses/' + runIdentifier.runIdentifier + '_'

			for i in 0..@statistics.length-1
				statistic = @statistics[i]

				@path = @basePath + statistic.name + ".txt"

				file = File.open(@path)

				if statistic.name == 'CooccurrenceRunStatistic'
					@newCode = '<img width="600px" src="/run_results_run_analyses/img/' + runIdentifier.runIdentifier + '/CooccurrenceRunStatistic/' + params[:id] + '"/>'
					@contentsTmp << @newCode
				elsif statistic.name == 'CooccurrenceBestRunStatistic'
					@newCode = '<img width="600px" src="/run_results_run_analyses/img/' + runIdentifier.runIdentifier + '/CooccurrenceBestRunStatistic/' + params[:id] + '"/>'
					@contentsTmp << @newCode
				elsif statistic.name == 'ooccurrenceRunStatistic'
					@newCode = '<table class="heat-map">'

					pos = 0
					header = []
	      			
					@content = ""
					while tmp = file.gets do
						@content << tmp
						if pos == 0
							@newCode << '<thead><tr><th>'
							header = tmp.split(',')
							@newCode << '</th>'
							split = tmp.split(',')
							split.each do |th|
								@newCode << '<th>'
								#<div class="box_rotate">'
								#@newCode << th
								@newCode << #'</div>
								'</th>'
							end
							@newCode << '</tr></thead>'
						elsif pos == 1
							@newCode << '<tbody><tr class="stats-row"><td class="stats-title">'
							@newCode << header[pos-1]
							@newCode << '</td><td>'
							@newCode << tmp.gsub(/\t/,'</td><td>')
						else
							@newCode << '<tr class="stats-row"><td class="stats-title">'
							@newCode << header[pos-1]
							@newCode << '</td><td>'
							@newCode << tmp.gsub(/\t/,'</td><td>')
						@newCode << '</td></tr>'
						end
						pos = pos+1
					end
					@newCode << '</tbody>'
					@contentsTmp << @content

	      			@newCode << '</table>'
	      		else
					@content = ""
					while tmp = file.gets do
						@content << tmp
					end
					@contentsTmp << @content
	      			@newCode = @content
	      		end

      			@codeTmp << @newCode
				
			end

			@code << @codeTmp

			@contents << @contentsTmp
		end
	end

	def img
		@runResult = RunResult.find_by_id(params[:id])

		send_file( @runResult.absPath + '/analyses/' + params[:runIdentifier] + '_' + params[:statisticName] + '.txt.png',
                :disposition => 'inline',
                :type => 'image/png',
                :stream => false,
                :filename => 'image.png' )
	end
end
