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
		
		@datasets = @datasetConfig.datasets
		
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

	def fetch_table_data
		@qualityMeasureName = params[:measureId]
		@qualityMeasure = ClusteringQualityMeasure.find(@qualityMeasureName)

		@iterations = ParameterOptimizationIterationsExt.joins(:program).where(:dataset_config_id => params[:id]).where(:clustering_quality_measure_id => @qualityMeasureName).select("alias, paramSetAsString, quality")

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
			@dataset = DatasetConfig.find_by_id(params[:id])
			@statistics = DatasetStatistic.where(:data_config_id => params[:data_config][:data_config_id]).where(:date => params[:data_config][:date])
			@dates = DatasetStatistic.select("DISTINCT date").where(:data_config_id => params[:data_config][:data_config_id])
		else
			@dataset = DatasetConfig.find_by_id(params[:id])
			@dataConfigs = DataConfig.where(:dataset_config_id => DatasetConfig.where(:dataset_config_id => params[:id]))
			@statistics = DatasetStatistic.where(:data_config_id => @dataConfigs.first.id)
			@dates = DatasetStatistic.select("DISTINCT date").where(:data_config_id => @dataConfigs.first.id)
			params[:data_config] = {}
			params[:data_config][:data_config_id] = @dataConfigs.first.id.to_s
			params[:data_config][:date] = @dates.first.date.to_s
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
		@dataset = DatasetConfig.find(params[:id])

		@dataset_id = params[:id]

		if params[:post]
			@qualityMeasure = ClusteringQualityMeasure.find_by_id(params[:post][:clustering_quality_measure_id2])
			@qualityMeasureName = @qualityMeasure.id
		else
			@qualityMeasure = ClusteringQualityMeasure.all(session).first
			@qualityMeasureName = @qualityMeasure.id
		end
		
		respond_to do |format|
			format.html # index.html.erb
			format.json { render :json => @dataset }
		end
	end

	def show_clusterings_fetch_graph_data
		@datasets = DatasetConfig.find(params[:id])
		@dataset_configs = DatasetConfig.where(:dataset_config_id => @datasets)
		@data_configs = DataConfig.where(:dataset_config_id => @dataset_configs)
		@runResultsParamOptIteration = ParameterOptimizationIteration.joins([:clustering_quality_measure, {:program_config => :program}]).where(:data_config_id => @data_configs).where(:clustering_quality_measure_id => params[:measureId]).select("value, programs.id AS program_id, quality,clustering_quality_measures.alias,paramName")
		
		@paramValuesQualityString = ''
		@runResultsParamOptIteration.each do |iteration|
			@paramValuesQualityString << iteration.alias
			@paramValuesQualityString << '	'
			@paramValuesQualityString << iteration.program_id.to_s
			@paramValuesQualityString << '	'
			@paramValuesQualityString << iteration.paramName
			@paramValuesQualityString << '	'
			@paramValuesQualityString << iteration.value.to_s
			@paramValuesQualityString << '	'
			@paramValuesQualityString << iteration.quality.to_s
			@paramValuesQualityString << '
'
		end
		@paramValuesQualityString = @paramValuesQualityString.chop

		render :inline => @paramValuesQualityString
	end

	def show_bestclusterings
		@dataset = DatasetConfig.find(params[:id])

		@dataset_id = params[:id]

		if params[:post]
			@qualityMeasure = ClusteringQualityMeasure.find_by_id(params[:post][:clustering_quality_measure_id2])
			@qualityMeasureName = @qualityMeasure.id
		else
			@qualityMeasure = ClusteringQualityMeasure.all(session).first
			@qualityMeasureName = @qualityMeasure.id
		end
		
		respond_to do |format|
			format.html # index.html.erb
			format.json { render :json => @dataset }
		end
	end
end
