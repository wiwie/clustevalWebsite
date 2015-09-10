class ClusteringQualityMeasure < ActiveRecord::Base
	belongs_to :repository
  
  def self.all(session = nil, *args)
    if session
      return self.where("repository_id = ?",Repository.find(session))
    else
      return super()
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
