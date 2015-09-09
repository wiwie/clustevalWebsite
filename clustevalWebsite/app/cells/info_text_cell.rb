class InfoTextCell < MyCell
	include ActionView::Helpers::FormTagHelper

  def show(opts)

  	begin
  		# TODO
  		render :view => 'display_' + opts[:controller] + '_' + opts[:action]
  	rescue
  		render :text => ''
  	end
  end

end
