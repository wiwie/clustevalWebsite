module ApplicationHelper

	def link_to(body, url, html_options = {})
		if url.instance_of?(Dataset)
 			html_options = html_options.merge({:tooltip_info => url_for(:controller => 'datasets', :action => 'tooltip_info', :id => url).to_s})
 		elsif url.instance_of?(Program)
 			html_options = html_options.merge({:tooltip_info => url_for(:controller => 'programs', :action => 'tooltip_info', :id => url).to_s})
 		elsif url.instance_of?(ClusteringQualityMeasure)
 			html_options = html_options.merge({:tooltip_info => url_for(:controller => 'clustering_quality_measures', :action => 'tooltip_info', :id => url).to_s})
 		#not necessary: those links are created manually
 		#elsif url.instance_of?(RunResultsParameterOptimizationsParameterSetIteration)
 		#	html_options = html_options.merge({:tooltip_info => url_for(:controller => 'run_results_parameter_optimizations_parameter_set_iterations', :action => 'tooltip_info', :id => url).to_s})
 		end
 		super
	end
end