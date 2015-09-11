class DatasetDescriptionCell < MyCell
	include ActionView::Helpers::FormTagHelper

	def show(opts)
		begin
	  		render :view => 'display', :locals => {:dataset => opts[:dataset], :detailsLink => opts[:detailsLink]}
	  		return
	  	rescue
	  	end
	  	render :text => opts[:dataset].full_name + '<br />'
	end
end
