class AddIndexToParamOptItExts < ActiveRecord::Migration
  def change
  	add_index "parameter_optimization_iterations_exts", ["clustering_quality_measure_id","dataset_id","program_id","quality"], :name => "paramOptItExts_k1"
  end
end
