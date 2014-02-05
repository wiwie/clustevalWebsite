class ClusteringQualityMeasure < ActiveRecord::Base
	belongs_to :repository
  
  def self.all(session, *args)
    if session
      return self.find(:all, :conditions => ["repository_id = ?",Repository.find(session)])
    else
      return super.all
    end
  end

  def optimum
    @optimum = ClusteringQualityMeasureOptimum.find_by_measure_name(self.name)
    if @optimum
      return @optimum.name
    else
      return 'Maximum'
    end
  end
end
