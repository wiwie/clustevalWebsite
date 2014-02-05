class DatasetFormatsController < ApplicationController
	

	def index
		@datasetFormats = DatasetFormat.all(params[:repository])
		
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
