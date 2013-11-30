class RunResultsRunAnalysesController < ApplicationController
	before_filter :require_user

	def show
		@statistics = []

		@runResult = RunResult.find_by_id(params[:id])

		@run = Run.find(@runResult.run_id)
		@runAnalysis = RunAnalysis.find_by_run_id(@run.id)
		@runRunAnalysis = RunRunAnalysis.find_by_run_analysis_id(@runAnalysis.id)

		@runRunAnalysisRunIdentifier = RunRunAnalysisRunIdentifier.where(:run_run_analysis_id => @runRunAnalysis.id)

		@runsAnalysisStatistic = RunAnalysisStatistic.where(:run_analysis_id => @runAnalysis.id)
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
	      		elsif statistic.name == 'ParameterImportanceRunStatistic'
					@map = {}
					@tmpMap = {}
					@percentilesMap = {}
					@measures = Set.new
					@datasets = Set.new
					@parameter = Set.new
					while tmp = file.gets do
						split = tmp.split(/\t/)
						if not @map[split[2]]
							@map[split[2]] = {}
						end
						if not @map[split[2]][split[1]]
							@map[split[2]][split[1]] = {}
						end
						@map[split[2]][split[1]][split[0]] = split[3]
						@measures.add(split[2])
						@datasets.add(split[1])
						@parameter.add(split[0])

						# put temporary values into percentiles map
						if not @tmpMap[split[1]]
							@tmpMap[split[1]] = {}
							@percentilesMap[split[1]] = {}
						end
						if not @tmpMap[split[1]][split[0]]
							@tmpMap[split[1]][split[0]] = Set.new
						end
						@tmpMap[split[1]][split[0]].add(split[3].gsub("\n","").to_f)
					end

					# calculate percentiles
					@tmpMap.keys.each do |ds|
						@tmpMap[ds].keys.each do |param|
							@percentilesMap[ds][param] = calculate_percentile(@tmpMap[ds][param].to_a, [0.0,0.25,0.5,0.75,1.0])
						end
					end

					@content = []
					@content << @map
					@content << @measures.to_a.sort_by{|x| x}
					@content << @datasets.to_a.sort_by{|x| x}
					@content << @parameter.to_a.sort_by{|x| x}
					@content << @percentilesMap

					@contentsTmp << @content
	      			@newCode = @content
	      		else
					@content = []
					while tmp = file.gets do
						@content << tmp.split(/\t/)
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

	def calculate_percentile(array=[],percentiles=[0.0])
		# multiply items in the array by the required percentile 
		# (e.g. 0.75 for 75th percentile)
		# round the result up to the next whole number
		# then subtract one to get the array item we need to return
		if not array
			return nil
		end

		result = []

		sortedArray = array.sort
	  	for i in 0..percentiles.length-1
			#result[i] = sortedArray[((sortedArray.length * percentiles[i]).ceil)-1]
	  		percentile = percentiles[i]
			k = (percentile*(sortedArray.length-1)+1).floor - 1
			f = (percentile*(sortedArray.length-1)+1).modulo(1)

    		result[i] = sortedArray[k] + (f * (sortedArray[k] - sortedArray[k-1]))
		end
		return result
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
