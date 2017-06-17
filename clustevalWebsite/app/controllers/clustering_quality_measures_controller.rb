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

	def histogram
		@measure = ClusteringQualityMeasure.find(params[:id])
		@histogram = RunResultsParameterOptimizationsQuality.where(:clustering_quality_measure => @measure).group("quality::numeric(7,2)").order("quality::numeric(7,2)").count

                respond_to do |format|
                        format.html # index.html.erb
                        format.json { render :json => @histogram }
                end
	end
end
