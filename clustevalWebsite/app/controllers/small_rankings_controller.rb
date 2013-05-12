class SmallRankingsController < ApplicationController
	def show
		respond_to do |format|
			format.html # index.html.erb
			format.json { render :json => json }
		end
	end

	def ds
		@type = params[:type]
		@id = params[:id]
		@qualityMeasure = params[:qualityMeasure]
		@optimum = ClusteringQualityMeasure.find_by_name(@qualityMeasure).optimum
		if @optimum == 'Maximum'
			@iterationsExts = ParameterOptimizationIterationsExt.select("program_id,dataset_id,max(quality) as maxQuality,paramSetAsString,clustering_quality_measure_id").where(:dataset_id => @id).where(:clustering_quality_measure_id => @qualityMeasure).group("program_id")
		else
			@iterationsExts = ParameterOptimizationIterationsExt.select("program_id,dataset_id,min(quality) as maxQuality,paramSetAsString,clustering_quality_measure_id").where(:dataset_id => @id).where(:clustering_quality_measure_id => @qualityMeasure).group("program_id")
		end
		@object = Dataset.find_by_id(@id)
	
		render :layout => false
	end

	def p
		@type = params[:type]
		@id = params[:id]
		@qualityMeasure = params[:qualityMeasure]
		@optimum = ClusteringQualityMeasure.find_by_name(@qualityMeasure).optimum
		if @optimum == 'Maximum'
			@iterationsExts = ParameterOptimizationIterationsExt.select("program_id,dataset_id,max(quality) as maxQuality,paramSetAsString,clustering_quality_measure_id").where(:program_id => @id).where(:clustering_quality_measure_id => @qualityMeasure).group("dataset_id")
		else
			@iterationsExts = ParameterOptimizationIterationsExt.select("program_id,dataset_id,min(quality) as maxQuality,paramSetAsString,clustering_quality_measure_id").where(:program_id => @id).where(:clustering_quality_measure_id => @qualityMeasure).group("dataset_id")
		end
		@object = Program.find_by_id(@id)

		render :layout => false
	end

	def dsp
		@type = params[:type]
		@id = params[:id]
		@inverted = params[:inv]
		@qualityMeasure = params[:qualityMeasure]
		@optimum = ClusteringQualityMeasure.find_by_name(@qualityMeasure).optimum
		if @optimum == 'Maximum'
			@iterationsExts = ParameterOptimizationIterationsExt.select("program_id,dataset_id,max(quality) as maxQuality,paramSetAsString,clustering_quality_measure_id").where(:clustering_quality_measure_id => @qualityMeasure).group("dataset_id,program_id")
		else
			@iterationsExts = ParameterOptimizationIterationsExt.select("program_id,dataset_id,min(quality) as maxQuality,paramSetAsString,clustering_quality_measure_id").where(:clustering_quality_measure_id => @qualityMeasure).group("dataset_id,program_id")
		end
		render :layout => false
	end
end
