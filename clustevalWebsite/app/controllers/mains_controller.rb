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

	def set_user_session_repository
		session[:repository_id] = Repository.find_by_id(params[:repository][:repository_id]).basePath
		redirect_to :action => 'index'
	end
end
