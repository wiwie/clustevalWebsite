class InfoTextCell < MyCell
	include ActionView::Helpers::FormTagHelper

  def show(view)

  	begin
  		# TODO
  		render view: view
  	rescue
  		render :text => ''
  	end
  end

end
