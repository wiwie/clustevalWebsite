class InfoTextCell < MyCell
	include ActionView::Helpers::FormTagHelper

  def show(view)

  	begin
  		# TODO
  		render view: view
  		return
  	rescue
  	end
  	render :text => ''
  end

end
