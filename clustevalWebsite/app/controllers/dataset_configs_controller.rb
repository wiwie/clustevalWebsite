class DatasetConfigsController < ApplicationController

	def index
		@datasetConfigs = DatasetConfig.all(params[:repository])
		
		respond_to do |format|
			format.html # index.html.erb
			format.json { render :json => @datasetConfigs }
		end
	end
	
	def show
		#@datasetConfig = DatasetConfig.find_by_name(params[:id])
		@datasetConfig = DatasetConfig.find(params[:id])
		
		@dataset = @datasetConfig.dataset
		
		file = File.open(@datasetConfig.abs_path)
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
