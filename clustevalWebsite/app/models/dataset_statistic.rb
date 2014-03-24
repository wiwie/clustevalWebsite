class DatasetStatistic < ActiveRecord::Base
	belongs_to :dataset
	belongs_to :run_result
	belongs_to :data_config

  	def content
		begin
			file = File.open(absPath + '/analyses/' + DataConfig.find(data_config_id).name + '_' + statistic + '.txt')
			@contents = []
			while tmp = file.gets do
				@contents << tmp.split(/\t/)
			end
			return @contents
		rescue
			return ['']
		end
	end
end
