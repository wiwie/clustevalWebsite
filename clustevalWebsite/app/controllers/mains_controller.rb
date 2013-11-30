class MainsController < ApplicationController
	
	def show
		respond_to do |format|
			format.html # index.html.erb
			format.json { render :json => json }
		end
	end

	def index
		if Repository.count == 0
			render :inline => '<div align="center"><h1>Error: clusteval database not initialized</h1>The framework has not been initialized and no repository could be found in the database.<br />Please initialize the framework by starting the backend server.<br /><br />For more detailed information please consult the clusteval technical documentation.</div>'
		else
			respond_to do |format|
				format.html # index.html.erb
				format.json { render :json => json }
			end
		end
	end

	def tableHeaderImage
		render :layout => false
	end

	def comparison
		if params[:post]
			@qualityMeasure = ClusteringQualityMeasure.find_by_id(params[:post][:measure])
			@inverted = params[:inv]
		else
			@qualityMeasures = ClusteringQualityMeasure.all(session)
			@qualityMeasures.each do |measure|
				if measure.name == 'TransClustF2ClusteringQualityMeasure'
					@qualityMeasure = measure
					break
				end
			end
			@inverted = false
		end
		if not @qualityMeasure
			@iterationsExts = {}
		else
			@qualityMeasureName = @qualityMeasure.id

			# data for table
			@iterationsExts = ParameterOptimizationIterationsExt.includes(:program, :dataset).select("program_id,dataset_id,max(quality) as maxQuality,min(quality) as minQuality,clustering_quality_measure_id").where(:clustering_quality_measure_id => @qualityMeasureName).group("dataset_id,program_id")
		end
		respond_to do |format|
			format.html # index.html.erb
			format.json { render :json => json }
		end
	end

	def workflow
	end

	def comparison_table_data
		# TODO: inverse
		@matrix = []
		@datasetIds = {}
		@datasets = Dataset.all(session)
		for i in 0..@datasets.length-1
		  @datasetIds[@datasets[i]] = i
		  @matrix << ['<a href="' + url_for({:only_path => true, :controller => 'datasets', :action => 'show', :id => @datasets[i]}) + '"/>' + @datasets[i].alias + '</a>']
		end
		@programIds = {}
		@programs = Program.all(session).sort_by{|x| x.alias}
		for i in 1..@programs.length
		  @programIds[@programs[i-1]] = i

		  for j in 0..@datasets.length-1
		    @matrix[j][i] = '--'
		  end
		end
		@qualityMeasure = ClusteringQualityMeasure.find_by_id(params[:qualityMeasure])
		@isMaximum = @qualityMeasure.optimum == 'Maximum'
		@rowMax = {}
		@rowMaxPos = {}
		@iterationsExts = ParameterOptimizationIterationsExt.includes(:program, :dataset).select("program_id,dataset_id,max(quality) as maxQuality,min(quality) as minQuality,clustering_quality_measure_id").where(:clustering_quality_measure_id => @qualityMeasure).group("dataset_id,program_id")
		@iterationsExts.each do |iterationExt|
		  datasetId = @datasetIds[iterationExt.dataset]
		  programId = @programIds[iterationExt.program]

		  next if datasetId == nil or programId == nil

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

		for i in 0..@datasets.length-1
			for j in 1..@programs.length
			    if not @matrix[i][j].to_s == "--"
			        @string = '<a href="/datasets/' + @datasets[i-1].id.to_s + '/bestclust/' + @programs[j-1].alias + '?post[clustering_quality_measure_id2]=' + @qualityMeasure.id.to_s + '">'

			        if @rowMaxPos[i] && @rowMaxPos[i].include?(j)
			          @string = @string + "<b>"
			        end

			        @string = @string + @matrix[i][j].to_s + '</a>'

			        if @rowMaxPos[i] && @rowMaxPos[i].include?(j)
			          @string = @string + "</b>"
			        end
			        @matrix[i][j] = @string
			    end
			end
		end
		render :inline => {"aaData" => @matrix}.to_json
	end

	def comparison_table_data_inverse
		@matrix = []
		@programIds = {}
		@datasets = Dataset.all(session).sort_by{|x| x.name}
		@programs = Program.all(session)
		for i in 0..@programs.length-1
		  @programIds[@programs[i]] = i
		  @matrix << ['<a href="' + url_for({:only_path => true, :controller => 'programs', :action => 'show', :id => @programs[i]}) + '"/>' + @programs[i].alias + '</a>']
		end
		@datasetIds = {}
		for i in 1..@datasets.length
		  @datasetIds[@datasets[i-1]] = i

		  for j in 0..@programs.length-1
		    @matrix[j][i] = '--'
		  end
		end
		@qualityMeasure = ClusteringQualityMeasure.find_by_id(params[:qualityMeasure])
		@isMaximum = @qualityMeasure.optimum == 'Maximum'

		@rowMax = {}
		@rowMaxPos = {}
		@iterationsExts = ParameterOptimizationIterationsExt.includes(:program, :dataset).select("program_id,dataset_id,max(quality) as maxQuality,min(quality) as minQuality,clustering_quality_measure_id").where(:clustering_quality_measure_id => @qualityMeasure).group("dataset_id,program_id")
		@iterationsExts.each do |iterationExt|
		  datasetId = @datasetIds[iterationExt.dataset]
		  programId = @programIds[iterationExt.program]

		  next if datasetId == nil or programId == nil

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

		for i in 0..@programs.length-1
			for j in 1..@datasets.length
			    if not @matrix[i][j].to_s == "--"
			        @string = '<a href="/datasets/' + @datasets[j-1].id.to_s + '/bestclust/' + @programs[i-1].alias + '?post[clustering_quality_measure_id2]=' + @qualityMeasure.id.to_s + '">'

			        if @rowMaxPos[i] && @rowMaxPos[i].include?(j)
			          @string = @string + "<b>"
			        end

			        @string = @string + @matrix[i][j].to_s + '</a>'

			        if @rowMaxPos[i] && @rowMaxPos[i].include?(j)
			          @string = @string + "</b>"
			        end
			        @matrix[i][j] = @string
			    end
			end
		end
		render :inline => {"aaData" => @matrix}.to_json
	end

	def set_user_session_repository
		session[:repository_id] = Repository.find_by_id(params[:repository][:repository_id]).basePath
		redirect_to :action => 'index'
	end
end
