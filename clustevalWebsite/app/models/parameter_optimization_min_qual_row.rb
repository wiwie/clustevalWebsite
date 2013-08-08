class ParameterOptimizationMinQualRow < ActiveRecord::Base
	belongs_to :program
	belongs_to :dataset_config
  # attr_accessible :title, :body
end
