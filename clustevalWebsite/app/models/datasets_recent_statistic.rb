class DatasetsRecentStatistic < ActiveRecord::Base
	belongs_to :dataset
	belongs_to :run_result
	belongs_to :data_config
  # attr_accessible :title, :body

  	def content
		file = File.open(absPath + '/analyses/' + DataConfig.find(data_config_id).name + '_' + statistic + '.txt')
		@contents = []
		while tmp = file.gets do
			@contents << tmp.split(/\t/)
		end
		return @contents
	end
end
