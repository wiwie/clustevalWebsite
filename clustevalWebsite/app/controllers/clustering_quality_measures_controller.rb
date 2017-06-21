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
		if @measure.min_value and @measure.max_value
			min = @measure.min_value
			max = @measure.max_value
		else
			min = RunResultsParameterOptimizationsQuality.where(:clustering_quality_measure => @measure).minimum("quality")
			max = RunResultsParameterOptimizationsQuality.where(:clustering_quality_measure => @measure).maximum("quality")
		end
		scale = (max-min)/100
		keys = *(0..100)
		zerokeys = Hash[*keys.collect { |v| [v, 0] }.flatten]
		@histogram = RunResultsParameterOptimizationsQuality.where(:clustering_quality_measure => @measure).group("floor((quality+#{-min})/#{scale})::numeric(7,0)").count
		@histogram = @histogram.sort_by{|k,v| k}
		@histogram = Hash[*@histogram.flatten]

		@allkeys = zerokeys.merge(@histogram)

		@allkeys.transform_keys!{|k| (k*scale+min).round(3)}
		totalSum = @allkeys.values.inject{|sum, v| sum + v }
		@allkeys.transform_values!{|v| v/totalSum.to_f}

                respond_to do |format|
                        format.html # index.html.erb
                        format.json { render :json => @allkeys }
                end
	end

	def correlations
		@measures = ClusteringQualityMeasure.all(params[:repository]).order(:alias)

		@cast = []
		i = 0
		@measures.each do |m1|
			j = 0
			@measures.each do |m2|
				corr = ClusteringQualityMeasuresSpearmanCorrelation.where(:clustering_quality_measure_1_id => m1).where(:clustering_quality_measure_2_id => m2)
				if corr.count > 0
					@cast << [i, j, corr.first.corr]
				else
					@cast << [i, j, nil]
				end
				j = j +1
			end
			i = i + 1
		end
		
                respond_to do |format|
                        format.html # index.html.erb
                        format.json { render :json => @cast }
                end
	end
end
