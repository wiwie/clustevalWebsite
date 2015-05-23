class CreateDatasetImages < ActiveRecord::Migration
  def change
    create_table :dataset_images do |t|
    	t.binary 'dataset_fullName',   :limit => 767, :null => false
    	t.binary 'dataset_imageUrl',   :limit => 500, :null => false
    end

    add_index "dataset_images", ["dataset_fullName"], :name => "fk_dataset_images_1", :unique => true, :length => {"dataset_fullName" => 767}
  end
end
