class CreateClusteringQualityMeasures < ActiveRecord::Migration
  def change
    create_table :clustering_quality_measures do |t|
	    t.integer "repository_id",                       :null => false
	    t.binary  "name",                 :limit => 200
	    t.float   "minValue"
	    t.float   "maxValue"
	    t.integer "requiresGoldStandard"
      t.binary  "alias",                 :limit => 200
    end
  	add_index "clustering_quality_measures", ["name", "repository_id"], :name => "name_UNIQUE", :unique => true, :length => {"name" => 200}
  	add_index "clustering_quality_measures", ["repository_id"], :name => "fk_clusteringQualityMeasures_1"
    add_index "clustering_quality_measures", ["name"], :name => "name_INDEX", :length => {"name" => 200}
  end
end
