class DataConfig < ActiveRecord::Base
	belongs_to :repository
	belongs_to :dataset_config
	belongs_to :goldstandard_config
	belongs_to :data_config

	def name
		return (abs_path.split('/')[-1].gsub('.dataconfig',''))
	end

	#def to_param
	#	"#{name}"
	#end

  def self.all(session = nil, *args)
	if session
		return self.where("repository_id = ?",Repository.find(session))
	else
		return super()
	end
  end
end
