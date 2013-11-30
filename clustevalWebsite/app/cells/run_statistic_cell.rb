class RunStatisticCell < Cell::Rails

  def display(opts)
  		@statistic = opts[:statistic]
  		@content = opts[:content]
  		@id = opts[:id]

		if @statistic == 'ParameterImportanceRunStatistic'
			@stringArgs = []
			@stringArgs << 'Parameter Importance'
			@stringArgs << 'Clustering Quality Measure'
			@stringArgs << 'Parameter Importance'
			render :partial => 'runstatistic_plot_bar', :locals => {:statistic => @statistic, :content => @content, :stringArgs => @stringArgs, :id => @id}
		else
			render :partial => 'runstatistic_text', :locals => {:statistic => @statistic, :content => @content, :id => @id}
		end
  end

end
