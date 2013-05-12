class ProgramsController < ApplicationController

	def index
		@programs = Program.all(session)
		
		respond_to do |format|
			format.html # index.html.erb
			format.json { render :json => @programs }
		end
	end

	def download
		@program = Program.find_by_id(params[:id])

		send_file @program.absPath
	end
	
	def show
		@program = Program.find(params[:id])
		
		respond_to do |format|
			format.html # index.html.erb
			format.json { render :json => @program }
		end
	end

	def comparison
		respond_to do |format|
			format.html # index.html.erb
			format.json { render :json => @program }
		end
	end

	def show_performance
		@program = Program.find(params[:id])
		
		respond_to do |format|
			format.html # index.html.erb
			format.json { render :json => @program }
		end
	end

	def show_bestclusterings
		@program = Program.find(params[:id])

		@program_id = params[:id]

		if params[:post]
			@qualityMeasure = ClusteringQualityMeasure.find_by_id(params[:post][:clustering_quality_measure_id2])
			@qualityMeasureName = @qualityMeasure.id
		else
			@qualityMeasure = ClusteringQualityMeasure.find_by_name('TransClustF2ClusteringQualityMeasure')
			@qualityMeasureName = @qualityMeasure.id
		end
		
		respond_to do |format|
			format.html # index.html.erb
			format.json { render :json => @program }
		end
	end
end
