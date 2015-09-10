class NavigationCell < MyCell
	include SimpleNavigation::Helpers

  def show(view)
  	begin
  		render :view => view
  	rescue
    	render :view => 'display'
	end
  end

end
