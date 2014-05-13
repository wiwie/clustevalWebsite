class ClusteringQualityMeasuresController < ApplicationController

	def index
		@measures = ClusteringQualityMeasure.all(params[:repository])
		
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

	def tooltip_info
		@measure = ClusteringQualityMeasure.find(params[:id])

		render partial: 'tooltip_info'
	end
end
