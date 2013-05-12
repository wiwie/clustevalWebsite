class DatasetFormatsController < ApplicationController
	before_filter :require_user

	def index
		@datasetFormats = DatasetFormat.all(session)
		
		respond_to do |format|
			format.html # index.html.erb
			format.json { render :json => @datasetFormats }
		end
	end
	
	def show
		@datasetFormat = DatasetFormat.find_by_id(params[:id])
		
		respond_to do |format|
			format.html # index.html.erb
			format.json { render :json => @datasetFormat }
		end
	end
end
