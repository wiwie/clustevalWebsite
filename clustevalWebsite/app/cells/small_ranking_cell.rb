class SmallRankingCell < MyCell
	def dc_and_p_old(opts)
		@matrix = []
		datasetIds = {}
		@dataConfigs = DataConfig.all(params[:repository])
		@dataSets = Dataset.all(params[:repository])
		for i in 0..@dataConfigs.length-1
		  datasetIds[@dataSets[i]] = i
		  #@matrix << [link_to(Dataset.all(session)[i].name, Dataset.all(session)[i])]
		  @matrix << [@dataSets[i]]
		end
		programIds = {}
		@programs = Program.all(params[:repository])
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

		  @matrix[datasetId][programId] = (((isMaximum ? iterationExt.max_quality.to_f : iterationExt.min_quality.to_f)*1000).round/1000.0)
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

	def dc_and_p(opts)
		# data for plot
		@visibleDataConfigs = {}
		@visiblePrograms = {}
		
		@ranks = []

		@matrix = []
		@dataConfigsIds = {}
		@dataConfigs = DataConfig.where(:id => opts[:dataConfigs]).sort_by{|x| x.name}

		@showRanks = opts[:showRanks]

		@datasetAvg = {}
		@datasetNumber = {}
		@datasetMedian = {}

		for i in 0..@dataConfigs.length-1
		  @dataConfigsIds[@dataConfigs[i]] = i
		  #@matrix << [link_to(Dataset.all(session)[i].name, Dataset.all(session)[i])]
		  @matrix << [@dataConfigs[i]]
		end
		@programIds = {}
		@programs = Program.where(:id => opts[:methods]).sort_by{|x| x.alias}
		for i in 1..@programs.length
		  @programIds[@programs[i-1]] = i

		  for j in 0..@dataConfigs.length-1
		    @matrix[j][i] = '--'
		  end
		end
		@qualityMeasure = ClusteringQualityMeasure.find_by_id(opts[:qualityMeasure])
		@isMaximum = @qualityMeasure.optimum == 'Maximum'
		@rowMax = {}
		@rowMaxPos = {}
		opts[:iterationsExts].each do |iterationExt|
		  dataConfigId = @dataConfigsIds[iterationExt.data_config]
		  programId = @programIds[iterationExt.program]

		  next if dataConfigId == nil or programId == nil

		  @visibleDataConfigs[iterationExt.data_config] = true
		  @visiblePrograms[iterationExt.program] = true

		  @matrix[dataConfigId][programId] = (((@isMaximum ? iterationExt.max_quality.to_f : iterationExt.min_quality.to_f)*1000).round/1000.0)

		  if @rowMax[dataConfigId]
		  	if @isMaximum
			    if @rowMax[dataConfigId] < @matrix[dataConfigId][programId]
			      @rowMax[dataConfigId] = @matrix[dataConfigId][programId]
			      @rowMaxPos[dataConfigId] = [programId]
			    elsif @rowMax[dataConfigId] == @matrix[dataConfigId][programId]
			      @rowMaxPos[dataConfigId] << programId
			    end
			else
			    if @rowMax[dataConfigId] > @matrix[dataConfigId][programId]
			      @rowMax[dataConfigId] = @matrix[dataConfigId][programId]
			      @rowMaxPos[dataConfigId] = [programId]
			    elsif @rowMax[dataConfigId] == @matrix[dataConfigId][programId]
			      @rowMaxPos[dataConfigId] << programId
			    end
			end
		  else
		    @rowMax[dataConfigId] = @matrix[dataConfigId][programId]
		    @rowMaxPos[dataConfigId] = [programId]
		  end
		end
	  
		if opts[:showRanks]
			for j in 1..@programs.length
				@submatrix = @matrix.map{|x| x[j]}
				@rowRanks = @submatrix.map{|x| (x == "--") ? ("--") : (@submatrix.select{|y| (y != "--") and (y > x)}.length+1)}
				for i in 0..@dataConfigs.length-1
					@matrix[i][j] = @rowRanks[i]
				end
			end
		end


		for i in 0..@dataConfigs.length-1
			@datasetAvg[i] = @matrix[i][1..@programs.length].inject(0){ |sum, el| (el == "--") ? (sum) : (sum + el) }.to_f
			@datasetNumber[i] = @matrix[i][1..@programs.length].keep_if{|x| x != "--"}.length
		    
		    if @datasetNumber[i] > 0
		       @datasetAvg[i] = (@datasetAvg[i]/@datasetNumber[i]*1000).round/1000.0
		    else
		       @datasetAvg[i] = "--"
		    end
		    @datasetMedian[i] = median(@matrix[i][1..@matrix[i].length])
		end

		render :view => 'dc_and_p', :locals => {:matrix => @matrix, :rowMaxPos => @rowMaxPos, :programs => @programs, :dataConfigs => @dataConfigs, :dataConfigIds => @dataConfigIds, :programIds => @programIds, :showRanks => @showRanks}
	end

	def ds_and_p(opts)
		# data for plot
		@visibleDatasets = {}
		@visiblePrograms = {}
		
		@ranks = []

		@matrix = []
		@datasetIds = {}
		@datasets = Dataset.where(:id => opts[:datasets]).order(:alias)

		@showRanks = opts[:showRanks]

		@datasetAvg = {}
		@datasetNumber = {}
		@datasetMedian = {}

		for i in 0..@datasets.length-1
		  @datasetIds[@datasets[i]] = i
		  #@matrix << [link_to(Dataset.all(session)[i].name, Dataset.all(session)[i])]
		  @matrix << [@datasets[i]]
		end
		@programIds = {}
		@programs = Program.where(:id => opts[:methods]).order(:alias)
		for i in 1..@programs.length
		  @programIds[@programs[i-1]] = i

		  for j in 0..@datasets.length-1
		    @matrix[j][i] = '--'
		  end
		end
		@qualityMeasure = ClusteringQualityMeasure.find_by_id(opts[:qualityMeasure])
		@isMaximum = @qualityMeasure.optimum == 'Maximum'
		#@rowMax = {}
		#@rowMaxPos = {}
		opts[:iterationsExts].each do |iterationExt|
		  datasetId = @datasetIds[iterationExt.dataset]
		  programId = @programIds[iterationExt.program]

		  next if datasetId == nil or programId == nil

		  @visibleDatasets[iterationExt.dataset] = true
		  @visiblePrograms[iterationExt.program] = true

		  @matrix[datasetId][programId] = (((@isMaximum ? iterationExt.max_quality.to_f : iterationExt.min_quality.to_f)*1000).round/1000.0)

		#  if @rowMax[datasetId]
		#  	if @isMaximum
		#	    if @rowMax[datasetId] < @matrix[datasetId][programId]
		#	      @rowMax[datasetId] = @matrix[datasetId][programId]
		#	      @rowMaxPos[datasetId] = [programId]
		#	    elsif @rowMax[datasetId] == @matrix[datasetId][programId]
		#	      @rowMaxPos[datasetId] << programId
		#	    end
		#	else
		#	    if @rowMax[datasetId] > @matrix[datasetId][programId]
		#	      @rowMax[datasetId] = @matrix[datasetId][programId]
		#	      @rowMaxPos[datasetId] = [programId]
		#	    elsif @rowMax[datasetId] == @matrix[datasetId][programId]
		#	      @rowMaxPos[datasetId] << programId
		#	    end
		#	end
		#  else
		#    @rowMax[datasetId] = @matrix[datasetId][programId]
		#    @rowMaxPos[datasetId] = [programId]
		#  end
		end
	  
		if opts[:showRanks]
			for j in 1..@programs.length
				@submatrix = @matrix.map{|x| x[j]}
				@rowRanks = @submatrix.map{|x| (x == "--") ? ("--") : (@submatrix.select{|y| (y != "--") and (y > x)}.length+1)}
				for i in 0..@datasets.length-1
					@matrix[i][j] = @rowRanks[i]
				end
			end
		end


		#for i in 0..@datasets.length-1
		#	@datasetAvg[i] = @matrix[i][1..@programs.length].inject(0){ |sum, el| (el == "--") ? (sum) : (sum + el) }.to_f
		#	@datasetNumber[i] = @matrix[i][1..@programs.length].keep_if{|x| x != "--"}.length
		#    
		#    if @datasetNumber[i] > 0
		#       @datasetAvg[i] = (@datasetAvg[i]/@datasetNumber[i]*1000).round/1000.0
		#    else
		#       @datasetAvg[i] = "--"
		#    end
		#    @datasetMedian[i] = median(@matrix[i][1..@matrix[i].length])
		#end

		render :view => 'ds_and_p', :locals => {:matrix => @matrix, :rowMaxPos => @rowMaxPos, :programs => @programs, :dataSets => @datasets, :datasetIds => @datasetIds, :programIds => @programIds, :showRanks => @showRanks}
	end

	def median(array)
		sorted = array.keep_if{|i| i != "--"}.sort
  		len = sorted.length
  		if len == 0
  			return "--"
  		end
  		return (((sorted[(len - 1) / 2] + sorted[len / 2]) / 2.0)*1000).round/1000.0
	end

	def ds_and_p_inv(opts)
		# data for plot
		@visibleDatasets = {}
		@visiblePrograms = {}

		@showRanks = opts[:showRanks]

		@matrix = []
		
		@ranks = []
		
		@programIds = {}
		@datasets = Dataset.where(:id => opts[:datasets]).order(:alias)
		@programs = Program.where(:id => opts[:methods]).order(:alias)

		@programAvg = {}
		@programNumber = {}
		@programMedian = {}

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

		#@rowMax = {}
		#@rowMaxPos = {}
		opts[:iterationsExts].each do |iterationExt|
		  datasetId = @datasetIds[iterationExt.dataset]
		  programId = @programIds[iterationExt.program]

		  next if datasetId == nil or programId == nil

		  @visibleDatasets[iterationExt.dataset] = true
		  @visiblePrograms[iterationExt.program] = true

		  @matrix[programId][datasetId] = (((@isMaximum ? iterationExt.max_quality.to_f : iterationExt.min_quality.to_f)*1000).round/1000.0)

		 #  if @rowMax[programId]
		 #  	if @isMaximum
			#     if @rowMax[programId] < @matrix[programId][datasetId]
			#       @rowMax[programId] = @matrix[programId][datasetId]
			#       @rowMaxPos[programId] = [datasetId]
			#     elsif @rowMax[programId] == @matrix[programId][datasetId]
			#       @rowMaxPos[programId] << datasetId
			#     end
			# else
			#     if @rowMax[programId] > @matrix[programId][datasetId]
			#       @rowMax[programId] = @matrix[programId][datasetId]
			#       @rowMaxPos[programId] = [datasetId]
			#     elsif @rowMax[programId] == @matrix[programId][datasetId]
			#       @rowMaxPos[programId] << datasetId
			#     end
			# end
		 #  else
		 #    @rowMax[programId] = @matrix[programId][datasetId]
		 #    @rowMaxPos[programId] = [datasetId]
		 #  end
		end
	  
		if opts[:showRanks]
			for j in 1..@datasets.length
				@submatrix = @matrix.map{|x| x[j]}
				@rowRanks = @submatrix.map{|x| (x == "--") ? ("--") : (@submatrix.select{|y| (y != "--") and (y > x)}.length+1)}
				for i in 0..@programs.length-1
					@matrix[i][j] = @rowRanks[i]
				end
			end
		end

		# for i in 0..@programs.length-1
		# 	@programAvg[i] = @matrix[i][1..@datasets.length].inject(0){ |sum, el| (el == "--") ? (sum) : (sum + el) }.to_f
		# 	@programNumber[i] = @matrix[i][1..@datasets.length].keep_if{|x| x != "--"}.length
		    
		#     if @programNumber[i] > 0
		# 		@programAvg[i] = (@programAvg[i]/@programNumber[i]*1000).round/1000.0
		#     else
		# 		@programAvg[i] = "--"
		#     end
		#     @programMedian[i] = median(@matrix[i][1..@matrix[i].length])
		# end

		render :view => 'ds_and_p_inv', :locals => {:matrix => @matrix, :rowMaxPos => @rowMaxPos, :programs => @programs, :dataSets => @datasets, :datasetIds => @datasetIds, :programIds => @programIds, :showRanks => opts[:showRanks]}
	end



	def dc_and_p_inv(opts)
		# data for plot
		@visibleDataConfigs = {}
		@visiblePrograms = {}

		@showRanks = opts[:showRanks]

		@matrix = []
		
		@ranks = []
		
		@programIds = {}
		@dataConfigs = DataConfig.where(:id => opts[:dataConfigs]).sort_by{|x| x.name}
		@programs = Program.where(:id => opts[:methods]).sort_by{|x| x.alias}

		@programAvg = {}
		@programNumber = {}
		@programMedian = {}

		for i in 0..@programs.length-1
		  @programIds[@programs[i]] = i
		  @matrix << [@programs[i]]
		end
		@dataConfigsIds = {}
		for i in 1..@dataConfigs.length
		  @dataConfigsIds[@dataConfigs[i-1]] = i

		  for j in 0..@programs.length-1
		    @matrix[j][i] = '--'
		  end
		end
		@qualityMeasure = ClusteringQualityMeasure.find_by_id(opts[:qualityMeasure])
		@isMaximum = @qualityMeasure.optimum == 'Maximum'

		@rowMax = {}
		@rowMaxPos = {}
		opts[:iterationsExts].each do |iterationExt|
		  dataConfigId = @dataConfigsIds[iterationExt.data_config]
		  programId = @programIds[iterationExt.program]

		  next if dataConfigId == nil or programId == nil

		  @visibleDataConfigs[iterationExt.data_config] = true
		  @visiblePrograms[iterationExt.program] = true

		  @matrix[programId][dataConfigId] = (((@isMaximum ? iterationExt.max_quality.to_f : iterationExt.min_quality.to_f)*1000).round/1000.0)

		  if @rowMax[programId]
		  	if @isMaximum
			    if @rowMax[programId] < @matrix[programId][dataConfigId]
			      @rowMax[programId] = @matrix[programId][dataConfigId]
			      @rowMaxPos[programId] = [dataConfigId]
			    elsif @rowMax[programId] == @matrix[programId][dataConfigId]
			      @rowMaxPos[programId] << dataConfigId
			    end
			else
			    if @rowMax[programId] > @matrix[programId][dataConfigId]
			      @rowMax[programId] = @matrix[programId][dataConfigId]
			      @rowMaxPos[programId] = [dataConfigId]
			    elsif @rowMax[programId] == @matrix[programId][dataConfigId]
			      @rowMaxPos[programId] << dataConfigId
			    end
			end
		  else
		    @rowMax[programId] = @matrix[programId][dataConfigId]
		    @rowMaxPos[programId] = [dataConfigId]
		  end
		end
	  
		if opts[:showRanks]
			for j in 1..@datasets.length
				@submatrix = @matrix.map{|x| x[j]}
				@rowRanks = @submatrix.map{|x| (x == "--") ? ("--") : (@submatrix.select{|y| (y != "--") and (y > x)}.length+1)}
				for i in 0..@programs.length-1
					@matrix[i][j] = @rowRanks[i]
				end
			end
		end

		for i in 0..@programs.length-1
			@programAvg[i] = @matrix[i][1..@dataConfigs.length].inject(0){ |sum, el| (el == "--") ? (sum) : (sum + el) }.to_f
			@programNumber[i] = @matrix[i][1..@dataConfigs.length].keep_if{|x| x != "--"}.length
		    
		    if @programNumber[i] > 0
				@programAvg[i] = (@programAvg[i]/@programNumber[i]*1000).round/1000.0
		    else
				@programAvg[i] = "--"
		    end
		    @programMedian[i] = median(@matrix[i][1..@matrix[i].length])
		end

		render :view => 'dc_and_p_inv', :locals => {:matrix => @matrix, :rowMaxPos => @rowMaxPos, :programs => @programs, :dataConfigs => @dataConfigs, :dataConfigsIds => @dataConfigsIds, :programIds => @programIds, :showRanks => opts[:showRanks]}
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
		@programs = Program.all(params[:repository])
		for i in 0..@programs.length-1
		  @programIds[@programs[i]] = i
		  @matrix << [@programs[i]]
		end
		@measureIds = {}
		@qualityMeasures = ClusteringQualityMeasure.all(params[:repository]).sort_by{|x| x.alias}
		for i in 1..@qualityMeasures.length
		  @measureIds[@qualityMeasures[i-1]] = i

		  for j in 0..@programs.length-1
		    @matrix[j][i] = '--'
		  end

		  if @qualityMeasures[i-1].min_value and @qualityMeasures[i-1].min_value < @minY
		  	@minY = @qualityMeasures[i-1].min_value
		  end

		  if @qualityMeasures[i-1].max_value and @qualityMeasures[i-1].max_value > @maxY
		  	@maxY = @qualityMeasures[i-1].max_value
		  end
		end
		opts[:iterationsExts].each do |iterationExt|
		  programId = @programIds[iterationExt.program]
		  measure = ClusteringQualityMeasure.find_by_id(iterationExt.clustering_quality_measure_id)
		  measureId = @measureIds[measure]
		  isMaximum = measure.optimum == 'Maximum'

		  @visiblePrograms[iterationExt.program] = true
		  if measure.min_value and measure.max_value
		  	@visibleMeasures[measure] = true
		  end

		  @matrix[programId][measureId] = (((isMaximum ? iterationExt.max_quality.to_f : iterationExt.min_quality.to_f)*1000).round/1000.0)
		end
		render :view => 'ds_and_q', :locals => {:matrix => @matrix, :programs => @programs, :programIds => @programIds, :qualityMeasures => @qualityMeasures, :measureIds => @measureIds, :minY => @minY, :maxY => @maxY, :dataset => opts[:obj]}
	end

# dataconfig vs quality
	def dc_and_q(opts)
		@matrix = []
		programIds = {}
		@programs = Program.all(params[:repository])
		for i in 0..@programs.length-1
		  programIds[@programs[i]] = i
		  @matrix << [@programs[i]]
		end
		measureIds = {}
		@qualityMeasures = ClusteringQualityMeasure.all(params[:repository])
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
		  @matrix[programId][measureId] = (((isMaximum ? iterationExt.max_quality : iterationExt.min_quality)*1000).round/1000.0)
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
		@datasets = Dataset.all(params[:repository])
		for i in 0..@datasets.length-1
		  @datasetIds[@datasets[i]] = i
		  @matrix << [@datasets[i]]
		end
		@measureIds = {}
		@qualityMeasures = ClusteringQualityMeasure.all(params[:repository]).sort_by{|x| x.alias}
		for i in 1..@qualityMeasures.length
		  @measureIds[@qualityMeasures[i-1]] = i

		  for j in 0..@datasets.length-1
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
		  datasetId = @datasetIds[iterationExt.dataset]
		  measure = ClusteringQualityMeasure.find_by_id(iterationExt.clustering_quality_measure_id)
		  measureId = @measureIds[measure]

		  @visibleDatasets[iterationExt.dataset] = true
		  @visibleMeasures[measure] = true

		  isMaximum = measure.optimum == 'Maximum'
		  @matrix[datasetId][measureId] = (((isMaximum ? iterationExt.max_quality.to_f : iterationExt.min_quality.to_f)*1000).round/1000.0)
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
			@iterationsExts = ParameterOptimizationMaxQualRow.joins([:program, :dataset, :run_results_parameter_optimizations_parameter_set_iteration]).select("DISTINCT parameter_optimization_max_qual_rows.program_id,parameter_optimization_max_qual_rows.dataset_id,quality,parameter_optimization_max_qual_rows.param_set_as_string,clustering_quality_measure_id,parameter_optimization_max_qual_rows.run_results_parameter_optimizations_parameter_set_iteration_id").where(:dataset_id => opts[:obj].id).where(:clustering_quality_measure_id => measure.id)
		else
			@iterationsExts = ParameterOptimizationMinQualRow.joins([:program, :dataset, :run_results_parameter_optimizations_parameter_set_iteration]).select("DISTINCT parameter_optimization_min_qual_rows.program_id,parameter_optimization_min_qual_rows.dataset_id,quality,parameter_optimization_min_qual_rows.param_set_as_string,clustering_quality_measure_id,parameter_optimization_min_qual_rows.run_results_parameter_optimizations_parameter_set_iteration_id").where(:dataset_id => opts[:obj].id).where(:clustering_quality_measure_id => measure.id)
		end
		render :view => 'ds', :locals => {:qualityMeasure => opts[:qualityMeasure], :iterationsExts => @iterationsExts, :program_filter => opts[:program_filter]}
	end

	def p(opts)
		measure = ClusteringQualityMeasure.find_by_id(opts[:qualityMeasure])
		if measure.optimum == 'Maximum'
			@iterationsExts = ParameterOptimizationMaxQualRow.joins([:program, :dataset]).select("parameter_optimization_max_qual_rows.program_id,parameter_optimization_max_qual_rows.dataset_id,quality,param_set_as_string,clustering_quality_measure_id").where(:program_id => opts[:obj].id).where(:clustering_quality_measure_id => measure.id)
		else
			@iterationsExts = ParameterOptimizationMinQualRow.joins([:program, :dataset]).select("parameter_optimization_min_qual_rows.program_id,parameter_optimization_min_qual_rows.dataset_id,quality,param_set_as_string,clustering_quality_measure_id").where(:program_id => opts[:obj].id).where(:clustering_quality_measure_id => measure.id)
		end
		render :view => 'p', :locals => {:qualityMeasure => opts[:qualityMeasure], :iterationsExts => @iterationsExts, :dataset_filter => opts[:dataset_filter]}
	end
end
