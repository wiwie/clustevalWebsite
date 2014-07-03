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
		else
			@qualityMeasures = ClusteringQualityMeasure.all(params[:repository])
			@qualityMeasures.each do |measure|
				if measure.name == 'TransClustF2ClusteringQualityMeasure'
					@qualityMeasure = measure
					break
				end
			end
			@inverted = false
		end

		if params[:selectMethods]
			@methods = params[:selectMethods]
		else
			@methods = Program.all(params[:repository]).map{|x| x.id}
		end

		if params[:selectDatasets]
			@datasets = params[:selectDatasets]
		else
			@datasets = Dataset.all(params[:repository]).map{|x| x.id}
		end

		if not @qualityMeasure
			@iterationsExts = {}
		else
			@qualityMeasureName = @qualityMeasure.id

			# data for table
			@iterationsExts = ParameterOptimizationIterationsExt.includes(:program, :dataset).select("program_id,dataset_id,max(quality) as maxQuality,min(quality) as minQuality,clustering_quality_measure_id").where(:clustering_quality_measure_id => @qualityMeasureName).where(:dataset_id => @datasets).where(:program_id => @methods).group("dataset_id,program_id")
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
	end
end
