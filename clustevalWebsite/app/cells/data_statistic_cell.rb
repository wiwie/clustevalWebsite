class DataStatisticCell < Cell::Rails

  def display(opts)
  		@statistic = opts[:statistic]
  		@content = opts[:content]
  		@id = opts[:id]

		if @statistic == 'IntraInterDistributionDataStatistic' or @statistic == 'SimilarityDistributionDataStatistic' or @statistic == 'NodeDegreeDistributionDataStatistic'
			@stringArgs = []
			if @statistic == 'IntraInterDistributionDataStatistic'
				@stringArgs << 'Intra/Inter Similarity Distribution'
				@stringArgs << 'Similarity'
				@stringArgs << 'Probability'
				@stringArgs << 'true'
				@stringArgs << ['Intra', 'Inter']
			elsif @statistic == 'SimilarityDistributionDataStatistic'
				@stringArgs << 'Similarity Distribution'
				@stringArgs << 'Similarity'
				@stringArgs << 'Probability'
				@stringArgs << 'false'
				@stringArgs << ['', '']
			elsif @statistic == 'NodeDegreeDistributionDataStatistic'
				@stringArgs << 'Node Degree Distribution'
				@stringArgs << 'Node Degree'
				@stringArgs << 'Frequency'
				@stringArgs << 'false'
				@stringArgs << ['', '']
			end
			render :partial => 'datastatistic_plot', :locals => {:statistic => @statistic, :content => @content, :stringArgs => @stringArgs, :id => @id}
		elsif @statistic == 'ClassSizeDistributionDataStatistic'
			@stringArgs = []
			@stringArgs << 'Class Size Distribution'
			@stringArgs << 'Class'
			@stringArgs << 'Size'
			render :partial => 'datastatistic_plot_bar', :locals => {:statistic => @statistic, :content => @content, :stringArgs => @stringArgs, :id => @id}
		else
			render :partial => 'datastatistic_text', :locals => {:statistic => @statistic, :content => @content, :id => @id}
		end
  end

end
