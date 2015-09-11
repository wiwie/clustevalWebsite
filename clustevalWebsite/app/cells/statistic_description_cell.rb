class StatisticDescriptionCell < MyCell
	def show(opts)
		begin
			# TODO
	  		render :view => 'display_' + opts[:statistic].name, :locals => {:statistic => opts[:statistic]}
	  		return
	  	rescue
		end
	  	render :text => 'No description has been written for this statistic yet.'
	end
end
