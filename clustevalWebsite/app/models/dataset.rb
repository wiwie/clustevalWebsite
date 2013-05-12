class Dataset < ActiveRecord::Base
  belongs_to :repository
	belongs_to :dataset_format
  belongs_to :dataset
  belongs_to :dataset_type
  has_many :dataset_configs

  def self.all(session, *args)
  if session
    @repoId = Repository.find_by_basePath(session[:repository_id]).id
    return self.find(:all, :conditions => ["repository_id = ?",@repoId])
  else
    return super.all
  end
  end

  def name
  	return (absPath.split('/')[-2] + '/' + absPath.split('/')[-1])
  end
end
