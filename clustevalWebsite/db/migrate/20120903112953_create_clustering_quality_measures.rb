class CreateClusteringQualityMeasures < ActiveRecord::Migration
  def change
    create_table :clustering_quality_measures do |t|
	    t.integer "repository_id",                       :null => false
	    t.binary  "name",                 :limit => 767
	    t.float   "min_value"
	    t.float   "max_value"
	    t.integer "requires_gold_standard"
      t.binary  "alias",                 :limit => 767
    end
  	add_index "clustering_quality_measures", ["name", "repository_id"], :name => "clustering_quality_measures_name_UNIQUE", :unique => true, :length => {"name" => 767}
  	add_index "clustering_quality_measures", ["repository_id"], :name => "fk_clusteringQualityMeasures_1"
    add_index "clustering_quality_measures", ["name"], :name => "name_INDEX", :length => {"name" => 767}
  end
end
