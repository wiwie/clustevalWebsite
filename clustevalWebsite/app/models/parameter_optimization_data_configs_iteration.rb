class ParameterOptimizationDataConfigsIteration < ActiveRecord::Base
	belongs_to :program
	belongs_to :data_config
end
