class RunResultDataAnalysisDataConfigsStatistic < ActiveRecord::Base
	belongs_to :run_result
	belongs_to :run_results_data_analysis
	belongs_to :data_config
	belongs_to :statistic
  # attr_accessible :title, :body

  	def content
		file = File.open(absPath + '/analyses/' + data_config.name + '_' + statistic.name + '.txt')
		@contents = []
		while tmp = file.gets do
			@contents << tmp.split(/\t/)
		end
		return @contents
	end
end
