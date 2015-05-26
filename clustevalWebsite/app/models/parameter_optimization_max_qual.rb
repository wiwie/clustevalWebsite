class ParameterOptimizationMaxQual < ActiveRecord::Base
	belongs_to :program
	belongs_to :dataset
	belongs_to :clustering_quality_measure
  # attr_accessible :title, :body
end
