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

	def comparison
		respond_to do |format|
			format.html # index.html.erb
			format.json { render :json }
		end
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

	def fetch_table_data
		@qualityMeasureName = params[:measureId]
		@qualityMeasure = ClusteringQualityMeasure.find(@qualityMeasureName)

		@iterations = ParameterOptimizationIterationsExt.joins(:program).where(:dataset_id => params[:id]).where(:clustering_quality_measure_id => @qualityMeasureName).select("alias, paramSetAsString, quality")

		@paramValuesQualityArray = []
		@iterations.each do |runResult|
			@paramValuesQualityArray << [
				runResult.alias, 
				runResult.paramSetAsString.gsub(',','<br />'),
        		runResult.quality
			]
		end

		@json = {"aaData" => @paramValuesQualityArray}.to_json
		render :inline => @json
	end

	def show_statistics
		if params[:data_config]
			@statistics = DatasetStatistic.where(:data_config_id => params[:data_config][:data_config_id])
		else
			@dataset = Dataset.find_by_id(params[:id])
			@dataConfigs = DataConfig.where(:dataset_config_id => DatasetConfig.where(:dataset_id => params[:id]))
			@statistics = DatasetStatistic.where(:data_config_id => @dataConfigs.first.id)
			params[:data_config] = {}
			params[:data_config][:data_config_id] = @dataConfigs.first.id.to_s
		end
		
		respond_to do |format|
			format.html # index.html.erb
			format.json { render :json => @dataset }
		end
	end

	def show_comparison
		@dataset_id = params[:id]
	end

	def show_clusterings
		@dataset = Dataset.find(params[:id])

		@dataset_id = params[:id]

		if params[:post]
			@qualityMeasure = ClusteringQualityMeasure.find_by_id(params[:post][:clustering_quality_measure_id2])
			@qualityMeasureName = @qualityMeasure.id
		else
			@qualityMeasure = ClusteringQualityMeasure.find_by_name('TransClustF2ClusteringQualityMeasure')
			@qualityMeasureName = @qualityMeasure.id
		end
		
		respond_to do |format|
			format.html # index.html.erb
			format.json { render :json => @dataset }
		end
	end

	def show_bestclusterings
		@dataset = Dataset.find(params[:id])

		@dataset_id = params[:id]

		if params[:post]
			@qualityMeasure = ClusteringQualityMeasure.find_by_id(params[:post][:clustering_quality_measure_id2])
			@qualityMeasureName = @qualityMeasure.id
		else
			@qualityMeasure = ClusteringQualityMeasure.find_by_name('TransClustF2ClusteringQualityMeasure')
			@qualityMeasureName = @qualityMeasure.id
		end
		
		respond_to do |format|
			format.html # index.html.erb
			format.json { render :json => @dataset }
		end
	end
end
