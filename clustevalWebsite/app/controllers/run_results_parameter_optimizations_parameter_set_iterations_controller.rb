class RunResultsParameterOptimizationsParameterSetIterationsController < ApplicationController
	

	def show
		 @iteration = RunResultsParameterOptimizationsParameterSetIteration.find(params[:id])
		 #@clustering = Clustering.includes({:clusters => :cluster_objects}).find(@iteration.clustering_id)
		 @clustering = Clustering.find(@iteration.clustering_id)
		 @paramSet = @iteration.run_results_parameter_optimizations_parameter_set
		 @paramOpt = @paramSet.run_results_parameter_optimization
		 @runResult = @paramOpt.run_results_execution.run_result

		@dataConfig = DataConfig.find(@paramOpt.data_config_id)
		@datasetConfig = @dataConfig.dataset_config
		@dataset = @datasetConfig.dataset

		@programConfig = ProgramConfig.find(@paramOpt.program_config_id)

		 @logContents = ""

		# log file
		logPath = @runResult.abs_path + '/logs/' + @programConfig.name + '_' + @dataConfig.name + '.' + @iteration.iteration.to_s + '.log'
		@logContents = ""
		if File.exist?(logPath)
			file = File.open(logPath)
			while tmp = file.gets do
				@logContents << tmp
			end
		end


		#clusteringPath = @paramOpt.abs_path.gsub('results.qual.complete','') + @iteration.iteration.to_s + '.results.conv'
		clusteringPath = @clustering.abs_path
		file = File.open(clusteringPath)
		@clusteringContents = []
		while tmp = file.gets do
			@clusteringContents << tmp
		end

		@clusteringContents = @clusteringContents[1].split(/\t/)[1]

		@clustering = {}
		@itemToCrispCluster = {}
		i = 0
		@clusteringContents.split(';').each do |clusterString|
			@clusterItems = {}
			@fuzzySum = 0.0
			clusterString.split(',').each do |clusterItemString|
				@coeff = clusterItemString.split(':')[1]
				@item = clusterItemString.split(':')[0]
				@clusterItems[@item] = @coeff
				@fuzzySum = @fuzzySum + @coeff.to_f
				if not @itemToCrispCluster.has_key?(@item) or (@itemToCrispCluster.has_key?(@item) and @coeff.to_f > @itemToCrispCluster[@item][1])
					@itemToCrispCluster[@item] = [i,@coeff.to_f]
				end
			end
			@clustering[(i+1).to_s] = [@clusterItems,@fuzzySum]
			i = i + 1
		end

		@qualities = @iteration.run_results_parameter_optimizations_qualities
		
		respond_to do |format|
			format.html # index.html.erb
			format.json { render :json => @paramOpt }
		end
	end
	
	def img
		 @iteration = RunResultsParameterOptimizationsParameterSetIteration.find(params[:id])
		 @paramSet = @iteration.run_results_parameter_optimizations_parameter_set
		 @paramOpt = @paramSet.run_results_parameter_optimization
		
		send_file( @paramOpt.abs_path.gsub('results.qual.complete','') + @iteration.iteration.to_s + '.results.conv.svg',
                :disposition => 'inline',
                :type => 'image/svg+xml',
                :stream => false,
                :filename => 'image.svg' )
	end

	def isoMDS
		 @iteration = RunResultsParameterOptimizationsParameterSetIteration.find(params[:id])
		 @paramSet = @iteration.run_results_parameter_optimizations_parameter_set
		 @paramOpt = @paramSet.run_results_parameter_optimization

		@dataConfig = DataConfig.find(@paramOpt.data_config_id)
		@datasetConfig = @dataConfig.dataset_config
		@dataset = @datasetConfig.dataset

		@isoMDSpath = @dataset.abs_path + '.strip.isoMDS'
		
		send_file( @isoMDSpath,
                :disposition => 'inline',
                :type => 'text',
                :stream => false,
                :filename => 'scatter.txt' )

		#send_file( @paramOpt.abs_path.gsub('results.qual.complete','') + @iteration.iteration.to_s + '.results.conv.isoMDS',
        #        :disposition => 'inline',
        #        :type => 'text',
        #        :stream => false,
        #        :filename => 'scatter.txt' )
	end

	def pca
		 @iteration = RunResultsParameterOptimizationsParameterSetIteration.find(params[:id])
		 @paramSet = @iteration.run_results_parameter_optimizations_parameter_set
		 @paramOpt = @paramSet.run_results_parameter_optimization

		@dataConfig = DataConfig.find(@paramOpt.data_config_id)
		@datasetConfig = @dataConfig.dataset_config
		@dataset = @datasetConfig.dataset

		@isoMDSpath = @dataset.abs_path + '.strip.PCA'
		
		send_file( @isoMDSpath,
                :disposition => 'inline',
                :type => 'text',
                :stream => false,
                :filename => 'scatter.txt' )

		#send_file( @paramOpt.abs_path.gsub('results.qual.complete','') + @iteration.iteration.to_s + '.results.conv.isoMDS',
        #        :disposition => 'inline',
        #        :type => 'text',
        #        :stream => false,
        #        :filename => 'scatter.txt' )
	end

	def tooltip_info
		@iteration = RunResultsParameterOptimizationsParameterSetIteration.find(params[:id])
		@paramSet = @iteration.run_results_parameter_optimizations_parameter_set
		@paramOpt = @paramSet.run_results_parameter_optimization
		 @runResult = @paramOpt.run_results_execution.run_result
		@dataConfig = DataConfig.find(@paramOpt.data_config_id)
		@datasetConfig = @dataConfig.dataset_config
		@dataset = @datasetConfig.dataset

		@programConfig = ProgramConfig.find(@paramOpt.program_config_id)

		clusteringPath = @paramOpt.abs_path.gsub('results.qual.complete','') + @iteration.iteration.to_s + '.results.conv'
		file = File.open(clusteringPath)
		@clusteringContents = []
		while tmp = file.gets do
			@clusteringContents << tmp
		end

		@clusteringContents = @clusteringContents[1].split(/\t/)[1]

		@clustering = {}
		i = 0
		@clusteringContents.split(';').each do |clusterString|
			@clusterItems = {}
			clusterString.split(',').each do |clusterItemString|
				@clusterItems[clusterItemString.split(':')[0]] = clusterItemString.split(':')[1]
			end
			@clustering[(i+1).to_s] = @clusterItems
			i = i + 1
		end

		render partial: 'tooltip_info'
	end
end
