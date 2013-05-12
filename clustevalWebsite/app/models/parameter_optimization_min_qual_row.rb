class ParameterOptimizationMinQualRow < ActiveRecord::Base
	belongs_to :program
	belongs_to :dataset
  # attr_accessible :title, :body
end
