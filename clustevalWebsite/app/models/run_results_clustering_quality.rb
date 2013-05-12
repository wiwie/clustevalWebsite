class RunResultsClusteringQuality < ActiveRecord::Base
	belongs_to :data_config
	belongs_to :program_config
	belongs_to :run_results_clustering
	belongs_to :repository
	belongs_to :clustering_quality_measure
end
