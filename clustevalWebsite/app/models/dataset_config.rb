class DatasetConfig < ActiveRecord::Base
	belongs_to :repository
	belongs_to :dataset_config
  	has_many :dataset_configs_datasets
  	has_many :datasets, through: :dataset_configs_datasets


	def to_param
		"#{name}"
	end

  def self.all(session, *args)
	if session
		return self.find(:all, :conditions => ["repository_id = ?",Repository.find_by_basePath(session[:repository_id]).id])
	else
		return super.all
	end
  end
end
