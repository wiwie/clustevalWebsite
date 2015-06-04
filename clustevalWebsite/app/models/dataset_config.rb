class DatasetConfig < ActiveRecord::Base
	belongs_to :repository
	belongs_to :dataset
	belongs_to :dataset_config


#	def to_param
#		"#{name}"
#	end

  def self.all(session, *args)
	if session
		return self.find(:all, :conditions => ["repository_id = ?",Repository.find(session)])
	else
		return super.all
	end
  end
end
