class InfoTextCell < Cell::Rails
	helper ActionView::Helpers::FormTagHelper

  def display

  	begin
  		render :view => 'display_' + params[:controller] + '_' + params[:action]
  	rescue
  		render :text => ''
  	end
  end

end
