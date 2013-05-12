class CreateClusteringQualityMeasureOptimums < ActiveRecord::Migration
  def change
    create_table :clustering_quality_measure_optimums do |t|
    	t.binary "measure_name", :limit => 200, :null => false
    	t.binary "name", 			:limit => 200, :null => false
    end

    add_index "clustering_quality_measure_optimums", ["measure_name"], :name => "name_UNIQUE", :unique => true, :length => {"measure_name" => 200}
  end
end
