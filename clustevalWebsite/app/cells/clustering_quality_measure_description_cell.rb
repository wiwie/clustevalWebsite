class ClusteringQualityMeasureDescriptionCell < MyCell
	def show(opts)
		begin
	  		render :view => 'display_' + opts[:measure].name, :locals => {:measure => opts[:measure]}
	  	rescue
	  		render :text => 'No description has been written for this measure yet.'
		end
	end
end
