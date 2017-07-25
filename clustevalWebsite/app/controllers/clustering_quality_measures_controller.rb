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

		coords = {}

		@cast = []
		i = 0
		@measures.each do |m1|
			newCoords = []
			j = 0
			@measures.each do |m2|
				corr = ClusteringQualityMeasuresSpearmanCorrelation.where(:clustering_quality_measure_1_id => m1).where(:clustering_quality_measure_2_id => m2)
				if corr.count > 0
					@cast << [i, j, corr.first.corr]
					newCoords << corr.first.corr
				else
					@cast << [i, j, nil]
					newCoords << nil
				end
				j = j +1
			end
			coords[m1.id] = newCoords
			i = i + 1
		end

		# dendrogram
		@dendro_height = 200
		@dendro_width = 800
		all_dists = all_pairwise_distances(coords)
		@min_dist = Float::MAX
		@max_dist = -Float::MAX
		@dendrogram = []
		@clusters = @measures.collect{|m| [m.id]}
		@clusterToDist = Hash[ *@clusters.collect { |v| [ [v], 0.0 ] }.flatten(2) ]
		while @clusters.length > 1
			p = find_clusterpair_with_min_dist(@clusters, all_dists)
			@clusters.delete_if {|x| x == p[0] or x == p[1] } 
			newC = p[0] + p[1]
			@clusters << newC
			@dendrogram << p
			@clusterToDist[newC] = p[2]
			if p[2] < @min_dist
				@min_dist = p[2]
			end
			if p[2] > @max_dist
				@max_dist = p[2]
			end
		end
		Rails.logger.info @clusterToDist
		
                respond_to do |format|
                        format.html # index.html.erb
                        format.json { render :json => @cast }
                end
	end

	def find_clusterpair_with_min_dist(clusters, dists)
		pair = nil
		mindist = Float::MAX
		clusters.each do |c1|
			clusters.each do |c2|
				if c1 == c2
					next
				end
				d = avg_linkage(c1, c2, dists)
				if d < mindist
					mindist = d
					pair = [c1, c2, d]
				end
			end
		end
		
		pair
	end

	def avg_linkage(cluster1, cluster2, dists)
		sum = 0
		cluster1.each do |o1|
			cluster2.each do |o2|
				sum += dists[o1][o2]
			end
		end
		sum /= cluster1.length*cluster2.length
		sum
	end

	def euclidean_distance(vector1, vector2)
	  sum = 0
	  vector1.zip(vector2).each do |v1, v2|
		if v1.nil? or v2.nil?
			next
		end
	    component = (v1 - v2)**2
	    sum += component
	  end
	  Math.sqrt(sum)
	end

	def all_pairwise_distances(coords)
		dists = {}
		coords.each do |k,v|
			dists[k] = {}
			coords.each do |k2,v2|
				dists[k][k2] = euclidean_distance(v,v2)
			end
		end
		dists
	end
end
