class CreateClusteringQualityMeasureOptimums < ActiveRecord::Migration
  def change
    create_table :clustering_quality_measure_optimums do |t|
    	t.binary "measure_name", :limit => 767, :null => false
    	t.binary "name", 			:limit => 767, :null => false
    end

    add_index "clustering_quality_measure_optimums", ["measure_name"], :name => "clustering_quality_measure_optimums_name_UNIQUE", :unique => true, :length => {"measure_name" => 767}
  end
end
