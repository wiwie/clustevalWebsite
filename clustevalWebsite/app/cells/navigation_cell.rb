class NavigationCell < MyCell
	include SimpleNavigation::Helpers

  def show(opts)
  	begin
  		# TODO
  		render :view => 'display_' + opts[:controller] + '_' + opts[:action]
  	rescue
    	render :view => 'display'
	end
  end

end
