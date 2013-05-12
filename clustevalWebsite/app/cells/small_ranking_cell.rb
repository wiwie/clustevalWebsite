class SmallRankingCell < Cell::Rails
	def dc_and_p(opts)
		@matrix = []
		datasetIds = {}
		@dataConfigs = DataConfig.all(session)
		@dataSets = Dataset.all(session)
		for i in 0..@dataConfigs.length-1
		  datasetIds[@dataSets[i]] = i
		  #@matrix << [link_to(Dataset.all(session)[i].name, Dataset.all(session)[i])]
		  @matrix << [@dataSets[i]]
		end
		programIds = {}
		@programs = Program.all(session)
		for i in 1..@programs.length
		  programIds[@programs[i-1]] = i

		  for j in 0..@dataSets.length-1
		    @matrix[j][i] = '--'
		  end
		end
		measure = ClusteringQualityMeasure.find_by_id(opts[:qualityMeasure])
		isMaximum = measure.optimum == 'Maximum'
		@rowMax = {}
		@rowMaxPos = {}
		opts[:iterationsExts].each do |iterationExt|
		  datasetId = datasetIds[iterationExt.dataset]
		  programId = programIds[iterationExt.program]

		  next if datasetId == nil or programId == nil

		  @matrix[datasetId][programId] = (((isMaximum ? iterationExt.maxQuality : iterationExt.minQuality)*1000).round/1000.0)
		  if @rowMax[datasetId]
		  	if isMaximum
			    if @rowMax[datasetId] < @matrix[datasetId][programId]
			      @rowMax[datasetId] = @matrix[datasetId][programId]
			      @rowMaxPos[datasetId] = [programId]
			    elsif @rowMax[datasetId] == @matrix[datasetId][programId]
			      @rowMaxPos[datasetId] << programId
			    end
			else
			    if @rowMax[datasetId] > @matrix[datasetId][programId]
			      @rowMax[datasetId] = @matrix[datasetId][programId]
			      @rowMaxPos[datasetId] = [programId]
			    elsif @rowMax[datasetId] == @matrix[datasetId][programId]
			      @rowMaxPos[datasetId] << programId
			    end
			end
		  else
		    @rowMax[datasetId] = @matrix[datasetId][programId]
		    @rowMaxPos[datasetId] = [programId]
		  end
		end
		render :view => 'dc_and_p', :locals => {:matrix => @matrix, :rowMaxPos => @rowMaxPos}
	end

	def ds_and_p(opts)
		# data for plot
		@visibleDatasets = {}
		@visiblePrograms = {}

		@matrix = []
		@datasetIds = {}
		@datasets = Dataset.all(session)
		for i in 0..@datasets.length-1
		  @datasetIds[@datasets[i]] = i
		  #@matrix << [link_to(Dataset.all(session)[i].name, Dataset.all(session)[i])]
		  @matrix << [@datasets[i]]
		end
		@programIds = {}
		@programs = Program.all(session).sort_by{|x| x.alias}
		for i in 1..@programs.length
		  @programIds[@programs[i-1]] = i

		  for j in 0..@datasets.length-1
		    @matrix[j][i] = '--'
		  end
		end
		@qualityMeasure = ClusteringQualityMeasure.find_by_id(opts[:qualityMeasure])
		@isMaximum = @qualityMeasure.optimum == 'Maximum'
		@rowMax = {}
		@rowMaxPos = {}
		opts[:iterationsExts].each do |iterationExt|
		  datasetId = @datasetIds[iterationExt.dataset]
		  programId = @programIds[iterationExt.program]

		  next if datasetId == nil or programId == nil

		  @visibleDatasets[iterationExt.dataset] = true
		  @visiblePrograms[iterationExt.program] = true

		  @matrix[datasetId][programId] = (((@isMaximum ? iterationExt.maxQuality : iterationExt.minQuality)*1000).round/1000.0)
		  if @rowMax[datasetId]
		  	if @isMaximum
			    if @rowMax[datasetId] < @matrix[datasetId][programId]
			      @rowMax[datasetId] = @matrix[datasetId][programId]
			      @rowMaxPos[datasetId] = [programId]
			    elsif @rowMax[datasetId] == @matrix[datasetId][programId]
			      @rowMaxPos[datasetId] << programId
			    end
			else
			    if @rowMax[datasetId] > @matrix[datasetId][programId]
			      @rowMax[datasetId] = @matrix[datasetId][programId]
			      @rowMaxPos[datasetId] = [programId]
			    elsif @rowMax[datasetId] == @matrix[datasetId][programId]
			      @rowMaxPos[datasetId] << programId
			    end
			end
		  else
		    @rowMax[datasetId] = @matrix[datasetId][programId]
		    @rowMaxPos[datasetId] = [programId]
		  end
		end
		render :view => 'ds_and_p', :locals => {:matrix => @matrix, :rowMaxPos => @rowMaxPos, :programs => @programs, :dataSets => @datasets, :datasetIds => @datasetIds, :programIds => @programIds}
	end

	def ds_and_p_inv(opts)
		# data for plot
		@visibleDatasets = {}
		@visiblePrograms = {}

		@matrix = []
		@programIds = {}
		@datasets = Dataset.all(session).sort_by{|x| x.name}
		@programs = Program.all(session)
		for i in 0..@programs.length-1
		  @programIds[@programs[i]] = i
		  @matrix << [@programs[i]]
		end
		@datasetIds = {}
		for i in 1..@datasets.length
		  @datasetIds[@datasets[i-1]] = i

		  for j in 0..@programs.length-1
		    @matrix[j][i] = '--'
		  end
		end
		@qualityMeasure = ClusteringQualityMeasure.find_by_id(opts[:qualityMeasure])
		@isMaximum = @qualityMeasure.optimum == 'Maximum'

		@rowMax = {}
		@rowMaxPos = {}
		opts[:iterationsExts].each do |iterationExt|
		  datasetId = @datasetIds[iterationExt.dataset]
		  programId = @programIds[iterationExt.program]

		  next if datasetId == nil or programId == nil

		  @visibleDatasets[iterationExt.dataset] = true
		  @visiblePrograms[iterationExt.program] = true

		  @matrix[programId][datasetId] = (((@isMaximum ? iterationExt.maxQuality : iterationExt.minQuality)*1000).round/1000.0)
		  if @rowMax[programId]
		  	if @isMaximum
			    if @rowMax[programId] < @matrix[programId][datasetId]
			      @rowMax[programId] = @matrix[programId][datasetId]
			      @rowMaxPos[programId] = [datasetId]
			    elsif @rowMax[programId] == @matrix[programId][datasetId]
			      @rowMaxPos[programId] << datasetId
			    end
			else
			    if @rowMax[programId] > @matrix[programId][datasetId]
			      @rowMax[programId] = @matrix[programId][datasetId]
			      @rowMaxPos[programId] = [datasetId]
			    elsif @rowMax[programId] == @matrix[programId][datasetId]
			      @rowMaxPos[programId] << datasetId
			    end
			end
		  else
		    @rowMax[programId] = @matrix[programId][datasetId]
		    @rowMaxPos[programId] = [datasetId]
		  end
		end
		render :view => 'ds_and_p_inv', :locals => {:matrix => @matrix, :rowMaxPos => @rowMaxPos, :programs => @programs, :dataSets => @datasets, :datasetIds => @datasetIds, :programIds => @programIds}
	end

# dataset vs quality
	def ds_and_q(opts)
		# data for plot
		@visiblePrograms = {}
		@visibleMeasures = {}

		@minY = 1
		@maxY = -1

		@matrix = []
		@programIds = {}
		@programs = Program.all(session)
		for i in 0..@programs.length-1
		  @programIds[@programs[i]] = i
		  @matrix << [@programs[i]]
		end
		@measureIds = {}
		@qualityMeasures = ClusteringQualityMeasure.all(session).sort_by{|x| x.alias}
		for i in 1..@qualityMeasures.length
		  @measureIds[@qualityMeasures[i-1]] = i

		  for j in 0..@programs.length-1
		    @matrix[j][i] = '--'
		  end

		  if @qualityMeasures[i-1].minValue and @qualityMeasures[i-1].minValue < @minY
		  	@minY = @qualityMeasures[i-1].minValue
		  end

		  if @qualityMeasures[i-1].maxValue and @qualityMeasures[i-1].maxValue > @maxY
		  	@maxY = @qualityMeasures[i-1].maxValue
		  end
		end
		opts[:iterationsExts].each do |iterationExt|
		  programId = @programIds[iterationExt.program]
		  measure = ClusteringQualityMeasure.find_by_id(iterationExt.clustering_quality_measure_id)
		  measureId = @measureIds[measure]
		  isMaximum = measure.optimum == 'Maximum'

		  @visiblePrograms[iterationExt.program] = true
		  if measure.minValue and measure.maxValue
		  	@visibleMeasures[measure] = true
		  end

		  @matrix[programId][measureId] = (((isMaximum ? iterationExt.maxQuality : iterationExt.minQuality)*1000).round/1000.0)
		end
		render :view => 'ds_and_q', :locals => {:matrix => @matrix, :programs => @programs, :programIds => @programIds, :qualityMeasures => @qualityMeasures, :measureIds => @measureIds, :minY => @minY, :maxY => @maxY, :dataset => opts[:obj]}
	end

# dataconfig vs quality
	def dc_and_q(opts)
		@matrix = []
		programIds = {}
		@programs = Program.all(session)
		for i in 0..@programs.length-1
		  programIds[@programs[i]] = i
		  @matrix << [@programs[i]]
		end
		measureIds = {}
		@qualityMeasures = ClusteringQualityMeasure.all(session)
		for i in 1..@qualityMeasures.length
		  measureIds[@qualityMeasures[i-1]] = i

		  for j in 0..@programs.length-1
		    @matrix[j][i] = '--'
		  end
		end
		opts[:iterationsExts].each do |iterationExt|
		  programId = programIds[iterationExt.program]
		  measure = ClusteringQualityMeasure.find_by_id(iterationExt.clustering_quality_measure_id)
		  measureId = measureIds[measure]
		  isMaximum = measure.optimum == 'Maximum'
		  @matrix[programId][measureId] = (((isMaximum ? iterationExt.maxQuality : iterationExt.minQuality)*1000).round/1000.0)
		end
		render :view => 'dc_and_q', :locals => {:matrix => @matrix, :programs => @programs, :qualityMeasures => @qualityMeasures}
	end

	def p_and_q(opts)
		# data for plot
		@visibleDatasets = {}
		@visibleMeasures = {}

		@minY = 1
		@maxY = -1

		@matrix = []
		@datasetIds = {}
		@datasets = Dataset.all(session)
		for i in 0..@datasets.length-1
		  @datasetIds[@datasets[i]] = i
		  @matrix << [@datasets[i]]
		end
		@measureIds = {}
		@qualityMeasures = ClusteringQualityMeasure.all(session).sort_by{|x| x.alias}
		for i in 1..@qualityMeasures.length
		  @measureIds[@qualityMeasures[i-1]] = i

		  for j in 0..@datasets.length-1
		    @matrix[j][i] = '--'
		  end

		  if @qualityMeasures[i-1].minValue and @qualityMeasures[i-1].minValue < @minY
		  	@minY = @qualityMeasures[i-1].minValue
		  end

		  if @qualityMeasures[i-1].maxValue and @qualityMeasures[i-1].maxValue > @maxY
		  	@maxY = @qualityMeasures[i-1].maxValue
		  end

		end
		@rowMax = {}
		@rowMaxPos = {}
		opts[:iterationsExts].each do |iterationExt|
		  datasetId = @datasetIds[iterationExt.dataset]
		  measure = ClusteringQualityMeasure.find_by_id(iterationExt.clustering_quality_measure_id)
		  measureId = @measureIds[measure]

		  @visibleDatasets[iterationExt.dataset] = true
		  @visibleMeasures[measure] = true

		  isMaximum = measure.optimum == 'Maximum'
		  @matrix[datasetId][measureId] = (((isMaximum ? iterationExt.maxQuality : iterationExt.minQuality)*1000).round/1000.0)
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
		end
		render :view => 'p_and_q', :locals => {:matrix => @matrix, :datasets => @datasets, :qualityMeasures => @qualityMeasures, :measureIds => @measureIds, :datasetIds => @datasetIds, :minY => @minY, :maxY => @maxY, :program => opts[:obj]}
	end

	def ds(opts)
		measure = ClusteringQualityMeasure.find_by_id(opts[:qualityMeasure])
		if measure.optimum == 'Maximum'
			@iterationsExts = ParameterOptimizationMaxQualRow.joins([:program, :dataset]).select("parameter_optimization_max_qual_rows.program_id,alias,parameter_optimization_max_qual_rows.dataset_id,quality,paramSetAsString,clustering_quality_measure_id").where(:dataset_id => opts[:obj].id).where(:clustering_quality_measure_id => measure.id)
		else
			@iterationsExts = ParameterOptimizationMinQualRow.joins([:program, :dataset]).select("parameter_optimization_max_qual_rows.program_id,alias,parameter_optimization_max_qual_rows.dataset_id,quality,paramSetAsString,clustering_quality_measure_id").where(:dataset_id => opts[:obj].id).where(:clustering_quality_measure_id => measure.id)
		end
		render :view => 'ds', :locals => {:qualityMeasure => opts[:qualityMeasure], :iterationsExts => @iterationsExts, :program_filter => opts[:program_filter]}
	end

	def p(opts)
		measure = ClusteringQualityMeasure.find_by_id(opts[:qualityMeasure])
		if measure.optimum == 'Maximum'
			@iterationsExts = ParameterOptimizationMaxQualRow.joins([:program, :dataset]).select("parameter_optimization_max_qual_rows.program_id,parameter_optimization_max_qual_rows.dataset_id,quality,paramSetAsString,clustering_quality_measure_id").where(:program_id => opts[:obj].id).where(:clustering_quality_measure_id => measure.id)
		else
			@iterationsExts = ParameterOptimizationMinQualRow.joins([:program, :dataset]).select("parameter_optimization_max_qual_rows.program_id,parameter_optimization_max_qual_rows.dataset_id,quality,paramSetAsString,clustering_quality_measure_id").where(:program_id => opts[:obj].id).where(:clustering_quality_measure_id => measure.id)
		end
		render :view => 'p', :locals => {:qualityMeasure => opts[:qualityMeasure], :iterationsExts => @iterationsExts, :dataset_filter => opts[:dataset_filter]}
	end
end
