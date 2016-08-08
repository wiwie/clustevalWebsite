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
		# another repository has been selected
		elsif params[:repo_select] and params[:repo_select][:repository_id]
			redirect_to :controller => 'mains', :action => 'index', :repository => params[:repo_select][:repository_id]
		# no repository has been selected -> redirect from / to /:repository/mains
		elsif not params[:repository]
			redirect_to :action => 'index', :repository => Repository.where(:repository_id => nil).first
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
			@showDataConfigs = params[:showDataConfigs]
			@showProgramConfigs = params[:showProgramConfigs]
			@showRanks = params[:showRanks]
		else
			@qualityMeasures = ClusteringQualityMeasure.all(params[:repository])
			@qualityMeasures.each do |measure|
				if measure.name == 'TransClustFClusteringQualityMeasure'
					@qualityMeasure = measure
					break
				end
			end
			@inverted = false
			@showDataConfigs = false
			@showProgramConfigs = false
			@showRanks = false
		end

		if params[:showProgramConfigs]
			@programConfigsSelectChoices = ProgramConfig.where(:repository_id => params[:repository]).where(:program_config_id => nil).order(:name)
			if params[:selectProgramConfigs]
				@programConfigs = params[:selectProgramConfigs]
			# if we have shown programs before, we take all program configs of those programs
			elsif params[:selectMethods]
				@programConfigs = ProgramConfig.where(:program => params[:selectMethods]).where(:program_config_id => nil).map{|x| x.id}
			else
				@programConfigs = ProgramConfig.all(params[:repository]).where(:program_config_id => nil).map{|x| x.id}
			end
		else
			@programsSelectChoices = Program.where(:repository_id => params[:repository]).order(:alias)
			if params[:selectMethods]
				@methods = params[:selectMethods]
			# if we have shown program configs before, we take all programs of those
			elsif params[:selectProgramConfigs]
				@methods = ProgramConfig.where(:id => params[:selectProgramConfigs]).map{|x| x.program_id}
			else
				@methods = Program.all(params[:repository]).map{|x| x.id}
			end
		end

		@measureSelectChoices = ClusteringQualityMeasure.where(:repository_id => params[:repository]).order(:alias)

		if params[:showDataConfigs]
			@dataConfigsSelectChoices = DataConfig.where(:repository_id => params[:repository]).where(:data_config_id => nil).order(:name)
			if params[:selectDataConfigs]
				@dataConfigs = params[:selectDataConfigs]
			# if we have shown data sets before, we take all data configs of those data sets
			elsif params[:selectDatasets]
				@dataConfigs = DataConfig.where(:dataset_config_id => DatasetConfig.where(:dataset_id => params[:selectDatasets])).where(:data_config_id => nil).map{|x| x.id}
			else
				@dataConfigs = DataConfig.all(params[:repository]).where(:data_config_id => nil).map{|x| x.id}
			end
		else
			@datasetsSelectChoices = Dataset.where(:repository_id => params[:repository]).where(:dataset_id => nil).where(:visibility => ['1','2']).order(:alias)
			if params[:selectDatasets]
				@datasets = params[:selectDatasets]
			# if we have shown data sets before, we take all data configs of those data sets
			elsif params[:selectDataConfigs]
				@datasets = DataConfig.includes({:dataset_config => :dataset}).where(:id => params[:selectDataConfigs]).map{|dc| dc.dataset_config}.map{|dsc| dsc.dataset_id}
			else
				@datasets = Dataset.all(params[:repository]).select{|x| x.visible.nil? || x.visible }.map{|x| x.id}
			end
		end

		if not @qualityMeasure
			@iterationsExts = {}
		else
			@qualityMeasureName = @qualityMeasure.id

			# data for table
			if params[:showDataConfigs]
				if params[:showProgramConfigs]
					@iterationsExts = ParameterOptimizationIterationsExtsConfig.includes(:program_config, :data_config).select(
						"program_config_id,data_config_id,max(quality) as max_quality,min(quality) as min_quality").where(
						:clustering_quality_measure_id => @qualityMeasureName).where(
						"data_config_id" => @dataConfigs).where(
						"program_config_id" => @programConfigs).group("data_config_id,program_config_id")
				else
					@iterationsExts = ParameterOptimizationIterationsExtsConfig.includes(:program, :data_config).select(
						"program_id,data_config_id,max(quality) as max_quality,min(quality) as min_quality").where(
						:clustering_quality_measure_id => @qualityMeasureName).where(
						"data_config_id" => @dataConfigs).where(
						"program_id" => @methods).group("data_config_id,program_id")
				end

			else
				if params[:showProgramConfigs]
					@iterationsExts = ParameterOptimizationIterationsExtsConfig.includes(:program_config, :dataset).select(
						"program_config_id,dataset_id,max(quality) as max_quality,min(quality) as min_quality").where(
						:clustering_quality_measure_id => @qualityMeasureName).where(
						"dataset_id" => @datasets).where(
						"program_config_id" => @programConfigs).group("dataset_id,program_config_id")
				else
					#@iterationsExts = ParameterOptimizationIterationsExtsConfig.includes(:program, :dataset).select(
					#	"program_id,dataset_id,max(quality) as max_quality,min(quality) as min_quality").where(
					#	:clustering_quality_measure_id => @qualityMeasureName).where(
					#	"dataset_id" => @datasets).where(
					#	"program_id" => @methods).group("dataset_id,program_id")
					#@iterationsExts = ParameterOptimizationIterationsExt.includes(:program, :dataset).select("program_id,dataset_id,max(quality) as max_quality,min(quality) as min_quality").where(:clustering_quality_measure_id => @qualityMeasureName).where(:dataset_id => @datasets).where(:program_id => @methods).group("dataset_id,program_id")
					@isMaximum = @qualityMeasure.optimum == 'Maximum'
					if @isMaximum
						@iterationsExts = ParameterOptimizationMaxQual.includes(:program, :dataset)
							.select("program_id,dataset_id,maxquality as max_quality")
							.where(:clustering_quality_measure_id => @qualityMeasureName)
							.where(:dataset_id => @datasets).where(:program_id => @methods)
					else
						@iterationsExts = ParameterOptimizationMinQual.includes(:program, :dataset)
							.select("program_id,dataset_id,minquality as min_quality")
							.where(:clustering_quality_measure_id => @qualityMeasureName)
							.where(:dataset_id => @datasets).where(:program_id => @methods)
					end
				end
			end
		end
		respond_to do |format|
			format.html # index.html.erb
			format.json { render :json => json }
		end
	end

	def set_user_session_repository
		redirect_to :action => 'index'
	end

	def workflow
		render 'workflow.svg', layout: false
	end
end
