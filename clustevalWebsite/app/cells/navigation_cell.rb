class NavigationCell < Cell::Rails
	helper SimpleNavigation::Helpers

  def display
  	begin
  		render :view => 'display_' + params[:controller] + '_' + params[:action]
  	rescue
    	render :view => 'display'
	end
  end

end
