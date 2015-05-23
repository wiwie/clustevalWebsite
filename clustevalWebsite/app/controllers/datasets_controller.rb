class DatasetsController < ApplicationController

	def index
		@dataset_types = DatasetType.all(params[:repository])

		@datasets = {}
		# this will take only those datasets, with the right repository id
		@allDatasets = Dataset.all(params[:repository])

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

		send_file @dataset.abs_path
	end

	def comparison
		respond_to do |format|
			format.html # index.html.erb
			format.json { render :json }
		end
	end
	
	def show
		@dataset = Dataset.find_by_id(params[:id])
		@description = DatasetDescription.find_by_dataset_fullName(@dataset.full_name)
		@publication = DatasetPublication.find_by_dataset_fullName(@dataset.full_name)

		# parse license document
		begin
			file = File.open(@dataset.abs_path + ".LICENSE")
			@license = ""
			while tmp = file.gets
				@license << tmp
			end
		rescue
		end

		file = File.open(@dataset.abs_path)
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

		columns = ['alias', 'param_set_as_string', 'quality']
		columnFormat = ['like','like','range']

		filterStrings = []
		for i in 0..columns.count-1
			format = columnFormat[i]
			if format == 'like'
				if params["sSearch_" + i.to_s] != ''
					filterStrings += [columns[i] + ' LIKE \'%' + params["sSearch_" + i.to_s] + '%\'']
				end
			elsif format == 'range'
				if params["sSearch_" + i.to_s] != '' and params["sSearch_" + i.to_s] != '~'
					split = params["sSearch_" + i.to_s].split('~')
					filterStrings += [columns[i] + ' BETWEEN ' + split[0] + ' AND ' + split[1]]
				end
			end
		end
		filterString = filterStrings.join(' AND ')

		@iterations = ParameterOptimizationIterationsExt
			.joins(:program)
			.where(:dataset_id => params[:id])
			.where(:clustering_quality_measure_id => @qualityMeasureName)
			.select("alias, param_set_as_string, quality")
			.order(columns[params[:iSortCol_0].to_i] + " " + params[:sSortDir_0])
			.limit(params[:iDisplayLength].to_i)
			.offset(params[:iDisplayStart].to_i)
			.where(filterString)

		@paramValuesQualityArray = []
		@iterations.each do |runResult|
			@paramValuesQualityArray << [
				runResult.alias, 
				runResult.param_set_as_string.gsub(',','<br />'),
        		runResult.quality
			]
		end

		@json = {"iTotalRecords" => ParameterOptimizationIterationsExt
			.joins(:program)
			.where(:dataset_id => params[:id])
			.where(:clustering_quality_measure_id => @qualityMeasureName)
			.select("alias, param_set_as_string, quality").count,
 				"iTotalDisplayRecords" => ParameterOptimizationIterationsExt
			.joins(:program)
			.where(:dataset_id => params[:id])
			.where(:clustering_quality_measure_id => @qualityMeasureName)
			.select("alias, param_set_as_string, quality")
			.where(filterString).count, 
 				"aaData" => @paramValuesQualityArray}.to_json
		render :inline => @json
	end

	def show_statistics
		if params[:data_config]
			@dataset = Dataset.find_by_id(params[:id])
			@statistics = DatasetStatistic.where(:data_config_id => params[:data_config][:data_config_id]).where(:date => params[:data_config][:date])
			@dates = DatasetStatistic.select("DISTINCT date").where(:data_config_id => params[:data_config][:data_config_id])
		else
			@dataset = Dataset.find_by_id(params[:id])
			@dataConfigs = DataConfig.where(:dataset_config_id => DatasetConfig.where(:dataset_id => params[:id]))
			@statistics = DatasetStatistic.where(:data_config_id => @dataConfigs.first.id)
			@dates = DatasetStatistic.select("DISTINCT date").where(:data_config_id => @dataConfigs.first.id)
			params[:data_config] = {}
			params[:data_config][:data_config_id] = @dataConfigs.first.id.to_s
			if @dates.first
				params[:data_config][:date] = @dates.first.date.to_s
			end
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
			@qualityMeasure = ClusteringQualityMeasure.all(params[:repository]).select{|x| x.name == 'TransClustF2ClusteringQualityMeasure'}.first
			@qualityMeasureName = @qualityMeasure.id
		end
		
		respond_to do |format|
			format.html # index.html.erb
			format.json { render :json => @dataset }
		end
	end

	def show_clusterings_fetch_graph_data
		@datasets = Dataset.find(params[:id])
		@datasets = Dataset.where(:dataset_id => @datasets)
		@dataset_configs = DatasetConfig.where(:dataset_id => @datasets)
		@data_configs = DataConfig.where(:dataset_config_id => @dataset_configs)
		@runResultsParamOptIteration = ParameterOptimizationIteration.joins([:clustering_quality_measure, {:program_config => :program}])
			.where(:data_config_id => @data_configs)
			.where(:clustering_quality_measure_id => params[:measureId])
			.select("value, programs.id AS program_id, quality,clustering_quality_measures.alias,paramName")
		
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

	def tooltip_info
		@dataset = Dataset.find(params[:id])
		@description = DatasetDescription.find_by_dataset_fullName(@dataset.full_name)
		@publication = DatasetPublication.find_by_dataset_fullName(@dataset.full_name)

		render partial: 'tooltip_info'
	end
end
