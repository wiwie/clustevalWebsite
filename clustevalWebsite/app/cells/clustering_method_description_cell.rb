class ClusteringMethodDescriptionCell < Cell::Rails
	helper ActionView::Helpers::FormTagHelper

	def display(opts)
		begin
	  		#render :view => 'display_' + opts[:method].full_name.gsub('/','_'), :locals => {:method => opts[:method]}
	  		render :view => 'display', :locals => {:method => opts[:method], :detailsLink => opts[:detailsLink]}
	  	rescue
	  		render :text => opts[:method].full_name + '<br />'
	  	end
	end
end
