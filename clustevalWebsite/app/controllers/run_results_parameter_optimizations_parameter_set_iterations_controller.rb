class RunResultsParameterOptimizationsParameterSetIterationsController < ApplicationController
	before_filter :require_user

	def show
		 @iteration = RunResultsParameterOptimizationsParameterSetIteration.find(params[:id])
		 #@clustering = Clustering.includes({:clusters => :cluster_objects}).find(@iteration.clustering_id)
		 @paramSet = @iteration.run_results_parameter_optimizations_parameter_set
		 @paramOpt = @paramSet.run_results_parameter_optimization
		 @runResult = @paramOpt.run_results_execution.run_result

		@dataConfig = DataConfig.find(@paramOpt.data_config_id)
		@datasetConfig = @dataConfig.dataset_config
		@dataset = @datasetConfig.dataset

		@programConfig = ProgramConfig.find(@paramOpt.program_config_id)

		 @logContents = ""

		# log file
		logPath = @runResult.absPath + '/logs/' + @programConfig.name + '_' + @dataConfig.name + '.' + @iteration.iteration.to_s + '.log'
		file = File.open(logPath)
		@logContents = ""
		while tmp = file.gets do
			@logContents << tmp
		end


		clusteringPath = @paramOpt.absPath.gsub('results.qual.complete','') + @iteration.iteration.to_s + '.results.conv'
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
			@clustering[i.to_s] = @clusterItems
			i = i + 1
		end

		
		respond_to do |format|
			format.html # index.html.erb
			format.json { render :json => @paramOpt }
		end
	end
	
	def img
		 @iteration = RunResultsParameterOptimizationsParameterSetIteration.find(params[:id])
		 @paramSet = @iteration.run_results_parameter_optimizations_parameter_set
		 @paramOpt = @paramSet.run_results_parameter_optimization
		
		send_file( @paramOpt.absPath.gsub('results.qual.complete','') + @iteration.iteration.to_s + '.results.conv.svg',
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

		@isoMDSpath = @dataset.absPath + '.isoMDS'
		
		send_file( @isoMDSpath,
                :disposition => 'inline',
                :type => 'text',
                :stream => false,
                :filename => 'scatter.txt' )

		#send_file( @paramOpt.absPath.gsub('results.qual.complete','') + @iteration.iteration.to_s + '.results.conv.isoMDS',
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

		@isoMDSpath = @dataset.absPath + '.PCA'
		
		send_file( @isoMDSpath,
                :disposition => 'inline',
                :type => 'text',
                :stream => false,
                :filename => 'scatter.txt' )

		#send_file( @paramOpt.absPath.gsub('results.qual.complete','') + @iteration.iteration.to_s + '.results.conv.isoMDS',
        #        :disposition => 'inline',
        #        :type => 'text',
        #        :stream => false,
        #        :filename => 'scatter.txt' )
	end
end
