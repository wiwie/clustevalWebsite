class Cluster < ActiveRecord::Base
	belongs_to :repository
	belongs_to :clustering
	has_many :cluster_objects
  # attr_accessible :title, :body

  def self.all(session, *args)
	if session
		return self.find(:all, :conditions => ["repository_id = ?",Repository.find(session).id])
	else
		return super.all
	end
  end
end
