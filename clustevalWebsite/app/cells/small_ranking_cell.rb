class SmallRankingCell < MyCell
	
	def data_vs_tools(opts)
		# data for plot
		@visibleDatas = {}
		@visiblePrograms = {}
		
		@ranks = []

		@inv = opts[:inv]

		if opts[:dataType] == "dataset"
			@datas = Dataset.where(:id => opts[:datas]).order(:alias)
		else
			@datas = DataConfig.where(:id => opts[:datas]).order(:name)
		end

		@dataType = opts[:dataType]
		@toolType = opts[:toolType]

		@showRanks = opts[:showRanks]
		if opts[:toolType] == "program"
			@programs = Program.where(:id => opts[:methods]).order(:alias)
		else
			@programs = ProgramConfig.where(:id => opts[:methods]).where(:program_config_id => nil).order(:name)
		end

		@yMin = 0
		@yMax = opts[:inv] ? @programs.length-1 : @datas.length-1

		@xMin = 1
		@xMax = opts[:inv] ? @datas.length : @programs.length

		# get indices for the matrix
		@dataIds = {}
		@programIds = {}

		for i in @yMin..@yMax
			if opts[:inv]
				@programIds[@programs[i]] = i
			else
		 		@dataIds[@datas[i]] = i
		 	end
		end
		for i in @xMin..@xMax
			if opts[:inv]
				@dataIds[@datas[i-1]] = i
			else
		  		@programIds[@programs[i-1]] = i
		  	end
		end

		# fill the matrix with values
		@matrix = []
		for i in @yMin..@yMax
			if opts[:inv]
				@matrix << [@programs[i]]
			else
		  		@matrix << [@datas[i]]
		  	end
		end
		for i in @xMin..@xMax
		  for j in @yMin..@yMax
		    @matrix[j][i] = '--'
		  end
		end

		@qualityMeasure = ClusteringQualityMeasure.find_by_id(opts[:qualityMeasure])
		@isMaximum = @qualityMeasure.optimum == 'Maximum'

		opts[:iterationsExts].each do |iterationExt|
			dataId = opts[:dataType] == "dataset" ? @dataIds[iterationExt.dataset] : @dataIds[iterationExt.data_config]
		  	programId = opts[:toolType] == "program" ? @programIds[iterationExt.program] : @programIds[iterationExt.program_config]

		  	next if dataId == nil or programId == nil

			if opts[:dataType] == "dataset"
			    @visibleDatas[iterationExt.dataset] = true
			else
				@visibleDatas[iterationExt.data_config] = true
		  	end
		  	if opts[:toolType] == "program"
		  		@visiblePrograms[iterationExt.program] = true
		  	else
		  		@visiblePrograms[iterationExt.program_config] = true
		  	end

		  	if opts[:inv]
		  		xInd = dataId
		  		yInd = programId
		  	else
		  		xInd = programId
		  		yInd = dataId
		  	end

			@matrix[yInd][xInd] = format_quality(@isMaximum ? iterationExt.max_quality.to_f : iterationExt.min_quality.to_f)
		end
	  
		if opts[:showRanks]
			for j in @xMin..@xMax
				@submatrix = @matrix.map{|x| x[j]}
				@rowRanks = @submatrix.map{|x| (x == "--" || x == "NaN") ? (x) : (@submatrix.select{|y| (y != "--" && y != "NaN") and (y > x)}.length+1)}
				for i in @yMin..@yMax
					@matrix[i][j] = @rowRanks[i]
				end
			end
		end

		if !@inv
			viewName = :data_vs_tools
		else
			viewName = :data_vs_tools_inv
		end

		render view: viewName, :locals => {:matrix => @matrix, :rowMaxPos => @rowMaxPos, :programs => @programs, 
			:datas => @datas, :dataIds => @dataIds, :programIds => @programIds, :showRanks => @showRanks}
	end

	def median(array)
		sorted = array.keep_if{|i| i != "--" && i != "NaN"}.sort
  		len = sorted.length
  		if len == 0
  			return "--"
  		end
  		return format_quality((sorted[(len - 1) / 2] + sorted[len / 2]) / 2.0)
	end

	def p_and_q(opts)
		# data for plot
		@visibleDatas = {}
		@visibleMeasures = {}

		@minY = 1
		@maxY = -1

		@matrix = []
		@dataIds = {}
		@datas = Dataset.all(params[:repository])
		for i in 0..@datas.length-1
		  @dataIds[@datas[i]] = i
		  @matrix << [@datas[i]]
		end
		@measureIds = {}
		@qualityMeasures = ClusteringQualityMeasure.all(params[:repository]).sort_by{|x| x.alias}
		for i in 1..@qualityMeasures.length
		  @measureIds[@qualityMeasures[i-1]] = i

		  for j in 0..@datas.length-1
		    @matrix[j][i] = '--'
		  end

		  if @qualityMeasures[i-1].min_value and @qualityMeasures[i-1].min_value < @minY
		  	@minY = @qualityMeasures[i-1].min_value
		  end

		  if @qualityMeasures[i-1].max_value and @qualityMeasures[i-1].max_value > @maxY
		  	@maxY = @qualityMeasures[i-1].max_value
		  end

		end
		@rowMax = {}
		@rowMaxPos = {}
		opts[:iterationsExts].each do |iterationExt|
		  datasetId = @dataIds[iterationExt.dataset]
		  measure = ClusteringQualityMeasure.find_by_id(iterationExt.clustering_quality_measure_id)
		  measureId = @measureIds[measure]

		  @visibleDatas[iterationExt.dataset] = true
		  @visibleMeasures[measure] = true

		  isMaximum = measure.optimum == 'Maximum'
		  @matrix[datasetId][measureId] = format_quality(isMaximum ? iterationExt.max_quality.to_f : iterationExt.min_quality.to_f)
		  #if not @matrix[datasetId][measureId].nan? and not @matrix[datasetId][measureId].infinite?
			  if @rowMax[datasetId]
			    if @rowMax[datasetId] < @matrix[datasetId][measureId]
			      @rowMax[datasetId] = @matrix[datasetId][measureId]
			      @rowMaxPos[datasetId] = [measureId]
			    elsif @rowMax[datasetId] == @matrix[datasetId][measureId]
			      @rowMaxPos[datasetId] << measureId
			    end
			  else
			    @rowMax[datasetId] = @matrix[datasetId][measureId]
			    @rowMaxPos[datasetId] = [measureId]
			  end
		  #end
		end
		render :locals => {:matrix => @matrix, :datasets => @datas, :qualityMeasures => @qualityMeasures, :measureIds => @measureIds, :datasetIds => @dataIds, :minY => @minY, :maxY => @maxY, :program => opts[:obj]}
	end

	def ds(opts)
		measure = ClusteringQualityMeasure.find_by_id(opts[:qualityMeasure])
		if measure.optimum == 'Maximum'
			@iterationsExts = ParameterOptimizationMaxQualRow
				.joins([:program, :dataset, :run_results_parameter_optimizations_parameter_set_iteration])
				.select("DISTINCT ON (parameter_optimization_max_qual_rows.program_id,parameter_optimization_max_qual_rows.dataset_id) parameter_optimization_max_qual_rows.program_id,parameter_optimization_max_qual_rows.dataset_id,quality,parameter_optimization_max_qual_rows.param_set_as_string,clustering_quality_measure_id,parameter_optimization_max_qual_rows.run_results_parameter_optimizations_parameter_set_iteration_id")
				.where(:dataset_id => opts[:obj].id)
				.where(:clustering_quality_measure_id => measure.id)
		else
			@iterationsExts = ParameterOptimizationMinQualRow
				.joins([:program, :dataset, :run_results_parameter_optimizations_parameter_set_iteration])
				.select("DISTINCT ON (parameter_optimization_min_qual_rows.program_id,parameter_optimization_min_qual_rows.dataset_id) parameter_optimization_min_qual_rows.program_id,parameter_optimization_min_qual_rows.dataset_id,quality,parameter_optimization_min_qual_rows.param_set_as_string,clustering_quality_measure_id,parameter_optimization_min_qual_rows.run_results_parameter_optimizations_parameter_set_iteration_id")
				.where(:dataset_id => opts[:obj].id)
				.where(:clustering_quality_measure_id => measure.id)
		end
		render :locals => {:qualityMeasure => opts[:qualityMeasure], :iterationsExts => @iterationsExts, :program_filter => opts[:program_filter]}
	end

	def p(opts)
		measure = ClusteringQualityMeasure.find_by_id(opts[:qualityMeasure])
		if measure.optimum == 'Maximum'
			@iterationsExts = ParameterOptimizationMaxQualRow
				.joins([:program, :dataset])
				.select("DISTINCT ON (parameter_optimization_max_qual_rows.program_id,parameter_optimization_max_qual_rows.dataset_id) parameter_optimization_max_qual_rows.program_id,parameter_optimization_max_qual_rows.dataset_id,quality,param_set_as_string,clustering_quality_measure_id")
				.where(:program_id => opts[:obj].id)
				.where(:clustering_quality_measure_id => measure.id)
		else
			@iterationsExts = ParameterOptimizationMinQualRow
				.joins([:program, :dataset])
				.select("DISTINCT ON (parameter_optimization_max_qual_rows.program_id,parameter_optimization_max_qual_rows.dataset_id) parameter_optimization_min_qual_rows.program_id,parameter_optimization_min_qual_rows.dataset_id,quality,param_set_as_string,clustering_quality_measure_id")
				.where(:program_id => opts[:obj].id)
				.where(:clustering_quality_measure_id => measure.id)
		end
		render :locals => {:qualityMeasure => opts[:qualityMeasure], :iterationsExts => @iterationsExts, :dataset_filter => opts[:dataset_filter]}
	end

	def format_quality(quality)
		if quality.nan?	
			return quality
		elsif quality.infinite?
			return quality
		else
			return (quality*1000).round/1000.0
		end
	end
end
