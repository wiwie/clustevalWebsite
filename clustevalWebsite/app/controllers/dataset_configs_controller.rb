class DatasetConfigsController < ApplicationController
	before_filter :require_user

	def index
		@datasetConfigs = DatasetConfig.all(session)
		
		respond_to do |format|
			format.html # index.html.erb
			format.json { render :json => @datasetConfigs }
		end
	end
	
	def show
		@datasetConfig = DatasetConfig.find_by_name(params[:id])
		
		@dataset = @datasetConfig.dataset
		
		file = File.open(@datasetConfig.absPath)
		@contents = ""
		while tmp = file.gets do
			@contents << tmp
		end

		
		respond_to do |format|
			format.html # index.html.erb
			format.json { render :json => @datasetConfig }
		end
	end
end
