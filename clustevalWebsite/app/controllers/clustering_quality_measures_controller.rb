class ClusteringQualityMeasuresController < ApplicationController

	def index
		@measures = ClusteringQualityMeasure.all(session)
		
		respond_to do |format|
			format.html # index.html.erb
			format.json { render :json => @measures }
		end
	end

	def show
		@measure = ClusteringQualityMeasure.find(params[:id])
		
		respond_to do |format|
			format.html # index.html.erb
			format.json { render :json => @measure }
		end
	end
end
