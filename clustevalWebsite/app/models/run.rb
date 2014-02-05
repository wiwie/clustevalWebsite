class Run < ActiveRecord::Base
	belongs_to :repository
	belongs_to :run_type
	belongs_to :run

	def to_param
  		"#{absPath}".split('/')[-1].gsub('.run','')
	end

  def self.all(session, *args)
	if session
		return self.find(:all, :conditions => ["repository_id = ?",Repository.find(session)])
	else
		return super.all
	end
  end
end
