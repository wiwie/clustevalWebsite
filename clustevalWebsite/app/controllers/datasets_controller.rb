class DatasetsController < ApplicationController

	def index
		@dataset_types = DatasetType.all(session)

		@datasets = {}
		# this will take only those datasets, with the right repository id
		@allDatasets = Dataset.all(session)

		@dataset_types.each do |dataset_type|
			@datasets[dataset_type] = @allDatasets.select{|x| x.dataset_type_id == dataset_type.id}
		end
		
		respond_to do |format|
			format.html # index.html.erb
			format.json { render :json => @datasets }
		end
	end

	def download
		@dataset = Dataset.find_by_id(params[:id])

		send_file @dataset.absPath
	end
	
	def show
		@dataset = Dataset.find_by_id(params[:id])

		@content = ''
		
		file = File.open(@dataset.absPath)
		@contents = ""
		for i in 1..10 do
			tmp = file.gets
			if (tmp == nil)
				break
			end
			if tmp.length > 100
				@contents << tmp[1,40] << "[...]" << tmp[-40,40]
			else
				@contents << tmp
			end
		end

		
		respond_to do |format|
			format.html # index.html.erb
			format.json { render :json => @dataset }
		end
	end
end
